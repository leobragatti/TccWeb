package br.com.fiap.digital;
import com.digitalpersona.onetouch.*;
import com.digitalpersona.onetouch.capture.DPFPCapture;
import com.digitalpersona.onetouch.capture.DPFPCapturePriority;
import com.digitalpersona.onetouch.capture.event.DPFPDataEvent;
import com.digitalpersona.onetouch.capture.event.DPFPDataListener;
import com.digitalpersona.onetouch.capture.event.DPFPReaderStatusAdapter;
import com.digitalpersona.onetouch.capture.event.DPFPReaderStatusEvent;
import com.digitalpersona.onetouch.processing.DPFPEnrollment;
import com.digitalpersona.onetouch.processing.DPFPFeatureExtraction;
import com.digitalpersona.onetouch.processing.DPFPImageQualityException;
import com.digitalpersona.onetouch.readers.DPFPReaderDescription;
import com.digitalpersona.onetouch.readers.DPFPReadersCollection;
import com.digitalpersona.onetouch.verification.DPFPVerification;
import com.digitalpersona.onetouch.verification.DPFPVerificationResult;

import java.io.IOException;
import java.util.EnumMap;
import java.util.concurrent.LinkedBlockingQueue;

import javax.servlet.jsp.JspWriter;

public class Digital {
	
	private JspWriter out;
	
	public Digital(JspWriter out){
		this.out = out;
	}
	
    public static final EnumMap<DPFPFingerIndex, String> fingerNames;
    static {
    	fingerNames = new EnumMap<DPFPFingerIndex, String>(DPFPFingerIndex.class);
    	fingerNames.put(DPFPFingerIndex.LEFT_PINKY,	  "left pinky");
    	fingerNames.put(DPFPFingerIndex.LEFT_RING,    "left ring");
    	fingerNames.put(DPFPFingerIndex.LEFT_MIDDLE,  "left middle");
    	fingerNames.put(DPFPFingerIndex.LEFT_INDEX,   "left index");
    	fingerNames.put(DPFPFingerIndex.LEFT_THUMB,   "left thumb");
    	fingerNames.put(DPFPFingerIndex.RIGHT_PINKY,  "right pinky");
    	fingerNames.put(DPFPFingerIndex.RIGHT_RING,   "right ring");
    	fingerNames.put(DPFPFingerIndex.RIGHT_MIDDLE, "right middle");
    	fingerNames.put(DPFPFingerIndex.RIGHT_INDEX,  "right index");
    	fingerNames.put(DPFPFingerIndex.RIGHT_THUMB,  "right thumb");
    }
    
    public DPFPTemplate getTemplate(String activeReader, int nFinger) throws IOException {
    	out.println("Realizando o análise...");
        
        DPFPTemplate template = null;
        
        try {
            DPFPFingerIndex finger = DPFPFingerIndex.values()[nFinger];
            DPFPFeatureExtraction featureExtractor = DPFPGlobal.getFeatureExtractionFactory().createFeatureExtraction();
            DPFPEnrollment enrollment = DPFPGlobal.getEnrollmentFactory().createEnrollment();
            
            while (enrollment.getFeaturesNeeded() > 0)
            {
                DPFPSample sample = getSample(activeReader, 
                	String.format("Coloque o %s (%d restante)<br>", fingerName(finger), enrollment.getFeaturesNeeded()));
                if (sample == null)
                    continue;

                DPFPFeatureSet featureSet;
                try {
                    featureSet = featureExtractor.createFeatureSet(sample, DPFPDataPurpose.DATA_PURPOSE_ENROLLMENT);
                } catch (DPFPImageQualityException e) {
                    out.println("Má qualidade da imagem: \" " + e.getCaptureFeedback().toString() + "\". Tente novamente. <br>");
                    continue;
                }

                enrollment.addFeatures(featureSet);
            }
            template = enrollment.getTemplate();
            out.println("O " + fingerprintName(finger) +" foi registrado.<br>");
        } catch (DPFPImageQualityException e) {
            out.println("Ocorreram problemas para registrar a digital.<br>");
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        
        return template;
    }

    public void listReaders() {
        DPFPReadersCollection readers = DPFPGlobal.getReadersFactory().getReaders();
        if (readers == null || readers.size() == 0) {
            System.out.println("There are no readers available.\n");
            return;
        }
        System.out.println("Available readers:\n");
        for (DPFPReaderDescription readerDescription : readers)
            System.out.println(readerDescription.getSerialNumber());
    }


    
    public boolean verify(String activeReader, byte[] digital) throws IOException {

        try {
            DPFPSample sample = getSample(activeReader, "Analise seu dedo<br>");
            if (sample == null)
                throw new Exception();
            
            DPFPTemplate template = DPFPGlobal.getTemplateFactory().createTemplate(digital);
            DPFPFeatureExtraction featureExtractor = DPFPGlobal.getFeatureExtractionFactory().createFeatureExtraction();
            DPFPFeatureSet featureSet = featureExtractor.createFeatureSet(sample, DPFPDataPurpose.DATA_PURPOSE_VERIFICATION);
			
            DPFPVerification matcher = DPFPGlobal.getVerificationFactory().createVerification();
            matcher.setFARRequested(DPFPVerification.MEDIUM_SECURITY_FAR);
            
            for (DPFPFingerIndex finger : DPFPFingerIndex.values()) {
                //DPFPTemplate template = user.getTemplate(finger);
                if (template != null) {
                    DPFPVerificationResult result = matcher.verify(featureSet, template);
                    if (result.isVerified()) {
                        out.println("Matching finger: " + fingerName(finger) + ", FAR obtido: " + (double)result.getFalseAcceptRate()/DPFPVerification.PROBABILITY_ONE + "<br>");
                        return result.isVerified();
                    }
                }
            }
        } catch (Exception e) {
            out.println("Ocorreram problemas na verificação");
        }
        
        return false;
    }

    public DPFPSample getSample(String activeReader, String prompt)
	throws InterruptedException, IOException
	{
	    final LinkedBlockingQueue<DPFPSample> samples = new LinkedBlockingQueue<DPFPSample>();
	    DPFPCapture capture = DPFPGlobal.getCaptureFactory().createCapture();
	    capture.setReaderSerialNumber(activeReader);
	    capture.setPriority(DPFPCapturePriority.CAPTURE_PRIORITY_LOW);
	    capture.addDataListener(new DPFPDataListener()
	    {
	        public void dataAcquired(DPFPDataEvent e) {
	            if (e != null && e.getSample() != null) {
	                try {
	                    samples.put(e.getSample());
	                } catch (InterruptedException e1) {
	                    e1.printStackTrace();
	                }
	            }
	        }
	    });
	    capture.addReaderStatusListener(new DPFPReaderStatusAdapter()
	    {
	    	int lastStatus = DPFPReaderStatusEvent.READER_CONNECTED;
			public void readerConnected(DPFPReaderStatusEvent e) {
				if (lastStatus != e.getReaderStatus())
					try {
						out.println("Leitor esta conectado");
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				lastStatus = e.getReaderStatus();
			}
			public void readerDisconnected(DPFPReaderStatusEvent e) {
				if (lastStatus != e.getReaderStatus())
					try {
						out.println("Leitor esta desconectado");
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				lastStatus = e.getReaderStatus();
			}
	    	
	    });
	    try {
	        capture.startCapture();
	        out.println(prompt);
	        return samples.take();
	    } catch (RuntimeException e) {
	        out.println("Failed to start capture. Check that reader is not used by another application.\n");
	        throw e;
	    } finally {
	        capture.stopCapture();
	    }
	}

    public String fingerName(DPFPFingerIndex finger) {
    	return fingerNames.get(finger); 
    }
    public String fingerprintName(DPFPFingerIndex finger) {
    	return fingerNames.get(finger) + " fingerprint"; 
    }

}

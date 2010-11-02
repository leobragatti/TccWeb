package br.com.fiap.digital;
import br.com.fiap.conversao.ImageConverter;

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

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.EnumMap;
import java.util.concurrent.LinkedBlockingQueue;

import javax.imageio.ImageIO;
import javax.management.RuntimeErrorException;
import javax.servlet.jsp.JspWriter;
import javax.swing.ImageIcon;

public class Digital {
	
	private PrintWriter out; 
	private DPFPEnrollment enrollment = DPFPGlobal.getEnrollmentFactory().createEnrollment();
	private Image imagemDigital;
	
	public Digital(PrintWriter out){
		this.out = out;
	}
	
	public void finalize() throws Throwable{
		enrollment = null;
		super.finalize();
	}
	
    public static final EnumMap<DPFPFingerIndex, String> fingerNames;
    static {
    	fingerNames = new EnumMap<DPFPFingerIndex, String>(DPFPFingerIndex.class);
    	fingerNames.put(DPFPFingerIndex.LEFT_PINKY,	  "mindinho esquerdo");
    	fingerNames.put(DPFPFingerIndex.LEFT_RING,    "anelar esquerdo");
    	fingerNames.put(DPFPFingerIndex.LEFT_MIDDLE,  "dedo m&eacute;dio esquerdo");
    	fingerNames.put(DPFPFingerIndex.LEFT_INDEX,   "indicador esquerdo");
    	fingerNames.put(DPFPFingerIndex.LEFT_THUMB,   "ded&atilde;o esquerdo");
    	fingerNames.put(DPFPFingerIndex.RIGHT_PINKY,  "mindinho esquerdo");
    	fingerNames.put(DPFPFingerIndex.RIGHT_RING,   "anelar direito");
    	fingerNames.put(DPFPFingerIndex.RIGHT_MIDDLE, "dedo m&eacute;dio direito");
    	fingerNames.put(DPFPFingerIndex.RIGHT_INDEX,  "indicador direito");
    	fingerNames.put(DPFPFingerIndex.RIGHT_THUMB,  "ded&atilde;o direito");
    }
    
    public byte[] lerDigital(String activeReader, int nFinger) throws Exception{
    	return getTemplate(activeReader, nFinger).serialize();
    }
    
    public byte[] lerSample(String activeReader) throws InterruptedException, IOException{
    	return getSample(activeReader, "Fa&ccedil; a leitura de sua digital").serialize();
    }
    
    public DPFPTemplate getTemplate(String activeReader, int nFinger) throws IOException {
    	//out.println("Realizando o an&aacute;lise...");
        
        DPFPTemplate template = null;
        try {
            DPFPFingerIndex finger = DPFPFingerIndex.values()[nFinger];
            DPFPFeatureExtraction featureExtractor = DPFPGlobal.getFeatureExtractionFactory().createFeatureExtraction();
            
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
                    //out.println("M&aacute; qualidade da imagem: \" " + e.getCaptureFeedback().toString() + "\". Tente novamente. <br>");
                    continue;
                }
                enrollment.addFeatures(featureSet);
            }
            template = enrollment.getTemplate();
            //out.println("O " + fingerprintName(finger) +" foi registrado.<br>");
        } catch (DPFPImageQualityException e) {
        	throw new RuntimeException(e);
            //out.println("Ocorreram problemas para registrar a digital.<br>");
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        
        return template;
    }

    public boolean existirLeitor() throws IOException {
    	DPFPReadersCollection readers = DPFPGlobal.getReadersFactory().getReaders();
        return !(readers == null || readers.size() == 0);
    }
    
    public boolean verify(byte[] digitalLida, byte[] digital) throws IOException {

        try {
        	DPFPSample sample = DPFPGlobal.getSampleFactory().createSample(digitalLida);
            DPFPTemplate template = DPFPGlobal.getTemplateFactory().createTemplate(digital);
            DPFPFeatureExtraction featureExtractor = DPFPGlobal.getFeatureExtractionFactory().createFeatureExtraction();
            DPFPFeatureSet featureSet = featureExtractor.createFeatureSet(sample, DPFPDataPurpose.DATA_PURPOSE_VERIFICATION);
			
            DPFPVerification matcher = DPFPGlobal.getVerificationFactory().createVerification();
            matcher.setFARRequested(DPFPVerification.MEDIUM_SECURITY_FAR);
            
            for (DPFPFingerIndex finger : DPFPFingerIndex.values()) {
                if (template != null) {
                    DPFPVerificationResult result = matcher.verify(featureSet, template);
                    if (result.isVerified()) {
                        //out.println("Matching finger: " + fingerName(finger) + ", FAR obtido: " + (double)result.getFalseAcceptRate()/DPFPVerification.PROBABILITY_ONE + "<br>");
                        return result.isVerified();
                    }
                }
            }
        } catch (Exception e) {
        	out.println("Ocorreram problemas na verifica&ccedil;ão");
        	throw new RuntimeException(e);
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
	                    convertSampleToBitmap(e.getSample());
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
					out.println("Leitor esta conectado");
				lastStatus = e.getReaderStatus();
			}
			public void readerDisconnected(DPFPReaderStatusEvent e) {
				if (lastStatus != e.getReaderStatus())
					out.println("Leitor esta desconectado");
				lastStatus = e.getReaderStatus();
			}
	    	
	    });
	    try {
	        capture.startCapture();	
	        //out.println(prompt);
	        return samples.take();
	    } catch (RuntimeException e){
	        //out.println("Failed to start capture. Check that reader is not used by another application.\n");
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
    	
	private void convertSampleToBitmap(DPFPSample sample) {
		imagemDigital = DPFPGlobal.getSampleConversionFactory().createImage(sample);
	}
	
	public byte[] retornarBytesImagemDigital(){
		return ImageConverter.convertToBytes(imagemDigital);
	}
	
}
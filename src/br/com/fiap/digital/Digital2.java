package br.com.fiap.digital;

import java.awt.*;
import java.awt.event.*;
import java.io.PrintWriter;

import javax.swing.SwingUtilities;

import com.digitalpersona.onetouch.*;
import com.digitalpersona.onetouch.capture.*;
import com.digitalpersona.onetouch.capture.event.*;
import com.digitalpersona.onetouch.processing.*;

public class Digital2 implements Runnable{
	
	private DPFPCapture capturer = DPFPGlobal.getCaptureFactory().createCapture();	
	private PrintWriter out;
	
	public Digital2(PrintWriter out) {
		this.out = out;
	}
	
	protected void init()
	{
		capturer.addDataListener(new DPFPDataAdapter() {
			@Override public void dataAcquired(final DPFPDataEvent e) {
					new Runnable() {	public void run() {
					makeReport("The fingerprint sample was captured.");
					setPrompt("Scan the same fingerprint again.");
					//process(e.getSample());
				}};
			}
		});
		capturer.addReaderStatusListener(new DPFPReaderStatusAdapter() {
			@Override public void readerConnected(final DPFPReaderStatusEvent e) {
				new Runnable() {	public void run() {	
		 			makeReport("The fingerprint reader was connected.");
				}};
			}
			@Override public void readerDisconnected(final DPFPReaderStatusEvent e) {
					new Runnable() {	public void run() {
					makeReport("The fingerprint reader was disconnected.");
				}};
			}
		});
		capturer.addSensorListener(new DPFPSensorAdapter() {
			@Override public void fingerTouched(final DPFPSensorEvent e) {
					new Runnable() {	public void run() {
					makeReport("The fingerprint reader was touched.");
				}};
			}
			@Override public void fingerGone(final DPFPSensorEvent e) {
					new Runnable() {	public void run() {	
					makeReport("The finger was removed from the fingerprint reader.");
				}};
			}
		});
		capturer.addImageQualityListener(new DPFPImageQualityAdapter() {
			@Override public void onImageQuality(final DPFPImageQualityEvent e) {
					new Runnable() {	public void run() {
					if (e.getFeedback().equals(DPFPCaptureFeedback.CAPTURE_FEEDBACK_GOOD))
						makeReport("The quality of the fingerprint sample is good.");
					else
						makeReport("The quality of the fingerprint sample is poor.");
				}};
			}
		});
	}

	protected void iniciar()
	{
		capturer.startCapture();
		setPrompt("<strong>Using the fingerprint reader, scan your fingerprint.</strong><br>");
	}

	protected void parar()
	{
		capturer.stopCapture();
	}

	public void setStatus(String string) {
		out.println(string);
	}
	public void setPrompt(String string) {
		out.println(string);
	}
	public void makeReport(String string) {
		out.println(string);
	}
	
	protected Image convertSampleToBitmap(DPFPSample sample) {
		return DPFPGlobal.getSampleConversionFactory().createImage(sample);
	}

	protected DPFPFeatureSet extractFeatures(DPFPSample sample, DPFPDataPurpose purpose)
	{
		DPFPFeatureExtraction extractor = DPFPGlobal.getFeatureExtractionFactory().createFeatureExtraction();
		try {
			return extractor.createFeatureSet(sample, purpose);
		} catch (DPFPImageQualityException e) {
			return null;
		}
	}

	public void run() {
		// TODO Auto-generated method stub
		init();
		iniciar();
	}	
	
	public void finalize(){
		parar();
	}
	
}

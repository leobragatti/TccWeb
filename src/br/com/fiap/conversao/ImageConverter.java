package br.com.fiap.conversao;

import java.awt.*;
import java.awt.image.*;

import javax.imageio.ImageIO;

import org.apache.tomcat.jni.File;

@SuppressWarnings("serial")
public class ImageConverter extends Component
{

	private MediaTracker mediaTracker;
	private Image image;

	private ImageConverter(Image image)
	{
		super();
		this.mediaTracker = new MediaTracker(this);
		this.mediaTracker.addImage(image, 0);
		this.image = image;
	}

	private BufferedImage convert()
	{
		/*
		 * Have to wait for image to load.
		 */
		try
		{
			this.mediaTracker.waitForID(0);
		}catch(InterruptedException e)
		{

		}

		GraphicsConfiguration graphicsConfig = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice().getDefaultConfiguration();
		BufferedImage bimage = graphicsConfig.createCompatibleImage(this.image.getWidth(null),this.image.getHeight(null));
		Graphics g = bimage.getGraphics();
		g.drawImage(image, 0, 0, null);
		return bimage;
	}

	private static byte[] convertIntToByteArray(int integer)
	{
		byte[] bytes = new byte[4];
		bytes[0] =(byte)( integer >> 24 );
		bytes[1] =(byte)( (integer << 8) >> 24 );
		bytes[2] =(byte)( (integer << 16) >> 24 );
		bytes[3] =(byte)( (integer << 24) >> 24 );
		return bytes;
	}

	private static byte[] convertIntArrayToByteArray(int[] integers)
	{
		byte[] bytes = new byte[integers.length*4];
		for (int index = 0; index < integers.length; index++)
		{
			byte[] integerBytes = convertIntToByteArray(integers[index]);
			bytes[index*4] =                integerBytes[0];
			bytes[1 + (index*4)] = integerBytes[1];
			bytes[2 + (index*4)] = integerBytes[2];
			bytes[3 + (index*4)] = integerBytes[3];
		}
		return bytes;
	}

	public static byte[] convertToBytes(Image image)
	{	
		ImageConverter converter = new ImageConverter(image);
		BufferedImage bufferedImage = converter.convert();
		PixelGrabber pixelGrabber = new PixelGrabber(image,0,0,bufferedImage.getWidth(),bufferedImage.getHeight(),true);
		try
		{
			if(pixelGrabber.grabPixels())
			{
				Object pixels = pixelGrabber.getPixels();
				if (pixels instanceof byte[])
				{       
					return (byte[])pixels;
				}
				return convertIntArrayToByteArray((int[])pixels);
			}
		}catch(InterruptedException e)
		{
		}
		return null;
	}

}
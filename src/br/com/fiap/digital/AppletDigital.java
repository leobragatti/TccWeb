package br.com.fiap.digital;

import java.awt.*;
import java.util.Random;

import javax.swing.*;

@SuppressWarnings("serial")
public class AppletDigital extends JApplet {

	Button move;
	Random r;

	public void init() {
		setLayout(null);
		move = new Button("Click me");
		add(move);
		move.reshape(10,10,70,30);
		r = new Random();
		setBackground(Color.red);
		setForeground(Color.yellow);
	}
	public void paint(Graphics g){
		g.drawString("Welcome JSP-Applet",100,100);
	}
	public boolean action(Event evt, Object whatAction) {
		if (!(evt.target instanceof Button))
			return false;
		String buttonLabel = (String)whatAction;
		if (buttonLabel == "Click me") {
			move.reshape(Math.abs(r.nextInt())%(size().width-70),
					Math.abs(r.nextInt())%(size().height-30),70,30);
			repaint();
		}
		return true;
	}

}

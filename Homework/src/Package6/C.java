package Package6;

import java.awt.*;
import java.awt.event.ActionEvent; 
import java.awt.event.ActionListener;   
import javax.swing.*;  
public class C extends JApplet implements ActionListener 
{  
	public JTextField jt1, jt2;    
	public Button b;    
	public JPanel p; 
	public void init()// ����ĳ�ʼ��  
	{
		resize(400, 300);   
		Container c = getContentPane();// ����    
		c.setLayout(new BorderLayout());// ��������  
		p = new JPanel();// �������     
		p.setLayout(new GridLayout(1, 3));// ��ʽ����   
		jt1 = new JTextField(10);      
		jt2 = new JTextField(10);  
		b = new Button("����");    
		b.addActionListener(this);   
		p.add(jt1);     
		p.add(b);   
		p.add(jt2);    
		c.add(p, BorderLayout.CENTER);     
	}
		public void actionPerformed(ActionEvent e) // ��ť���¼������� 
		{  
			Button source = (Button) e.getSource();  
			String whice = source.getLabel(); 
			if (whice.contentEquals("����")){   
				String heat = jt1.getText();   
				Double a = Double.parseDouble(heat);   
					a = (a - 32) / 1.8;   
					jt2.setText(a.toString() + "��C");  
			}
		}
}
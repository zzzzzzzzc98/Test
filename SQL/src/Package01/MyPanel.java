package Package01;

import java.awt.*;
import javax.swing.*;


public class MyPanel extends JPanel {
	 public void paintComponent(Graphics g){
	        super.paintComponent(g);
	        //����һ�ű���ͼƬ  2.jpg��ͼƬ��·��  �Լ��趨Ϊ�Լ���Ҫ��ӵ�ͼƬ
	        Image image = new ImageIcon("background.jpg").getImage();
	        g.drawImage(image, 0, 0, this);
	    }
}

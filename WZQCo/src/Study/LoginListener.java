package Study;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
 
import javax.swing.JButton;
import javax.swing.JOptionPane;

public class LoginListener implements MouseListener, WZQConfig, ActionListener{
	private int x, y;// �������λ��
	private int x1, y1, xx, yy;// ������������ӽ��������
	private Graphics g;
	private int a = 0, i = 0, j = 0, count1 = 0;// countͳ�Ƶ�ǰ�µ�������
	private String Str;// ����ȫ�ֱ�����ȡ��ť�ϵ��ַ���
	private JButton jbu1, jbu2;
	private int GetX[] = new int[256];
	private int GetY[] = new int[256];
	WZQFrame ui;
 
	public void setG(Graphics g) {
		this.g = g;
	}
 
	public void setT(JButton b) {
		jbu1 = b;
	}
 
	public void setU(WZQFrame u) {
		ui = u;
	}
 
	public void mouseClicked(MouseEvent e) {
 
	}
 
	public void mousePressed(MouseEvent e) {
 
	}
 
	public void mouseReleased(MouseEvent e) {
		x = e.getX();
		y = e.getY();
		x1 = Math.abs(x - START_X);
		y1 = Math.abs(y - START_Y);
		xx = x1 % SIZE;
		if (xx >= SIZE / 2) {
			x1 = (x1 / SIZE) + 2;
		} else {
			x1 = (x1 / SIZE) + 1;
		}
 
		yy = y1 % SIZE;// �жϺ������Ƿ񳬹����ӳ��ȵ�һ�루��ֹ��ҵ�ƫ��
		if (yy >= SIZE / 2) {
			y1 = (y1 / SIZE) + 2;
		} else {
			y1 = (y1 / SIZE) + 1;
		}
 
		if ((count1 + 1) % 2 == 1) {// ��������ʱ�º��壬˫��ʱ�°���
			g.setColor(Color.BLACK);
			if (bx[x1][y1] == 0) {
				bx[x1][y1] = 1;// ��ʾ����
				g.fillOval(Math.abs(x1 * SIZE - 25), Math.abs(y1 * SIZE - 25),
						50, 50);
				count1++;// ������������һ
				GetX[count1] = x1;// ��¼��count1��������xֵ
				GetY[count1] = y1;// ��¼��count1��������yֵ
				if (CheckRow(x1, y1) >= 5) {
					JOptionPane.showMessageDialog(null, "BLACK   WIN!!");
				}
				if (CheckList(x1, y1) >= 5) {
					JOptionPane.showMessageDialog(null, "BLACK   WIN!!");
				}
				if (UpperRight(x1, y1) >= 5) {
					JOptionPane.showMessageDialog(null, "BLACK   WIN!!");
				}
				if (UpperLeft(x1, y1) >= 5) {
					JOptionPane.showMessageDialog(null, "BLACK   WIN!!");
				}
			}
		} else {
			g.setColor(Color.WHITE);
			if (bx[x1][y1] == 0) {
				bx[x1][y1] = 2;// ��ʾ����
				g.fillOval(Math.abs(x1 * SIZE - 25), Math.abs(y1 * SIZE - 25),
						50, 50);
				count1++;// ������������һ
				GetX[count1] = x1;// ��¼��count1��������xֵ
				GetY[count1] = y1;// ��¼��count1��������yֵ
				if (CheckRow(x1, y1) >= 5) {
					JOptionPane.showMessageDialog(null, "WHITE   WIN!!");
				}
				if (CheckList(x1, y1) >= 5) {
					JOptionPane.showMessageDialog(null, "WHITE   WIN!!");
				}
				if (UpperRight(x1, y1) >= 5) {
					JOptionPane.showMessageDialog(null, "WHITE   WIN!!");
				}
				if (UpperLeft(x1, y1) >= 5) {
					JOptionPane.showMessageDialog(null, "WHITE   WIN!!");
				}
			}
		}
	}
 
	public void actionPerformed(ActionEvent e) {
		setT(jbu1);
		Str = e.getActionCommand();// ��ȡ�����ť�ϵ��ַ���
		if ("����".equals(Str)) {
			if (g.getColor() == Color.BLACK) {
				g.setColor(Color.WHITE);
			}
			if (g.getColor() == Color.WHITE) {
				g.setColor(Color.BLACK);
			}
			Regret();
			ui.repaint();
		} else if ("���¿�ʼ".equals(Str)) {
			Restart();
			ui.repaint();
		}
	}
 
	public void mouseEntered(MouseEvent e) {
 
	}
 
	public void mouseExited(MouseEvent e) {
 
	}
 
	public int CheckRow(int x, int y)// ������������һ��ֱ��
	{
		int count = 0;
		for (int i = x + 1; i < bx.length; i++)// �����ж��Ƿ�����һ��
		{
			if (bx[i][y] == bx[x][y])
				count++;
			else
				break;
		}
		for (int i = x; i >= 0; i--)// �����ж��Ƿ�����һ��
		{
			if (bx[i][y] == bx[x][y])
				count++;
			else
				break;
		}
		return count;
	}
 
	public int CheckList(int x, int y)// ������������һ��ֱ��
	{
		int count = 0;
		for (int i = y + 1; i < bx.length; i++)// �����ж��Ƿ�����һ��
		{
			if (bx[x][i] == bx[x][y])
				count++;
			else
				break;
		}
		for (int i = y; i >= 0; i--)// �����ж��Ƿ�����һ��
		{
			if (bx[x][i] == bx[x][y])
				count++;
			else
				break;
		}
		return count;
	}
 
	public int UpperRight(int x, int y)// ���ϵ�������������һ��ֱ��
	{
		int count = 0;
		for (int i = x + 1, j = y - 1; i < bx.length && j >= 0; i++, j--)// �����ж��Ƿ�����һ��
		{
			if (bx[i][j] == bx[x][y])
				count++;
			else
				break;
		}
		for (int i = x, j = y; i >= 0 && j < bx.length; i--, j++)// �����ж��Ƿ�����һ��
		{
			if (bx[i][j] == bx[x][y])
				count++;
			else
				break;
		}
		return count;
	}
 
	public int UpperLeft(int x, int y)// ���ϵ�������������һ��ֱ��
	{
		int count = 0;
		for (int i = x - 1, j = y - 1; i >= 0 && j >= 0; i--, j--)// �����ж��Ƿ�����һ��
		{
			if (bx[i][j] == bx[x][y])
				count++;
			else
				break;
		}
		for (int i = x, j = y; i < bx.length && j < bx.length; i++, j++)// �����ж��Ƿ�����һ��
		{
			if (bx[i][j] == bx[x][y])
				count++;
			else
				break;
		}
		return count;
	}
 
	public void Regret() {// ����
		bx[GetX[count1]][GetY[count1]] = 0;
		if (count1 > 0) {
			count1--;
		}
	}
 
	public void Restart() {//���¿�ʼ
		{
			for (int k = 0; k <= count1; k++) {
				bx[GetX[k]][GetY[k]] = 0;
			}
		}
	}

}

clc
clear

readpath = 'C:/Users/hdx/Desktop/ͼ����������/ָ�����/';
num = '7';


i0 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/cgi.bmp']);
i1 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/cubic.bmp']);
i2 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/fcgi.bmp']);
i3 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/sai.bmp']);
i4 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/gt.bmp']);
i5 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/lmmse.bmp']);
i6 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/narm.bmp']);
i7 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/nedi.bmp']);
i8 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/rsai.bmp']);
i9 = imread(['C:/Users/hdx/Desktop/ͼ����������/ָ�����/' num '/sme.bmp']);

width = 454;
height = 280;

i1 = i1(5:height,5:width);
i2 = i2(5:height,5:width);
i3 = i3(5:height,5:width);
i4 = i4(5:height,5:width);
i5 = i5(5:height,5:width);
i6 = i6(5:height,5:width);
i7 = i7(5:height,5:width);
i8 = i8(5:height,5:width);
i9 = i9(5:height,5:width);
i0 = i0(5:height,5:width);



imwrite(i0,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/cgi.bmp']);
imwrite(i1,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/cubic.bmp']);
imwrite(i2,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/fcgi.bmp']);
imwrite(i3,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/sai.bmp']);
imwrite(i4,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/gt.bmp']);
imwrite(i5,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/lmmse.bmp']);
imwrite(i6,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/narm.bmp']);
imwrite(i7,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/nedi.bmp']);
imwrite(i8,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/rsai.bmp']);
imwrite(i9,['C:/Users/hdx/Desktop/ͼ����������/ȥ��ָ��ͼ/' num '/sme.bmp']);
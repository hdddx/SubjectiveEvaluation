clc
clear

readpath = 'C:/Users/hdx/Desktop/图像质量测评/指标测试/';
num = '7';


i0 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/cgi.bmp']);
i1 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/cubic.bmp']);
i2 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/fcgi.bmp']);
i3 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/sai.bmp']);
i4 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/gt.bmp']);
i5 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/lmmse.bmp']);
i6 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/narm.bmp']);
i7 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/nedi.bmp']);
i8 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/rsai.bmp']);
i9 = imread(['C:/Users/hdx/Desktop/图像质量测评/指标测试/' num '/sme.bmp']);

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



imwrite(i0,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/cgi.bmp']);
imwrite(i1,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/cubic.bmp']);
imwrite(i2,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/fcgi.bmp']);
imwrite(i3,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/sai.bmp']);
imwrite(i4,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/gt.bmp']);
imwrite(i5,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/lmmse.bmp']);
imwrite(i6,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/narm.bmp']);
imwrite(i7,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/nedi.bmp']);
imwrite(i8,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/rsai.bmp']);
imwrite(i9,['C:/Users/hdx/Desktop/图像质量测评/去边指标图/' num '/sme.bmp']);
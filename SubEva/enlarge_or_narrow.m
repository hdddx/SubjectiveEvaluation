function img = enlarge_or_narrow(GT,multiple,x,y)
[height,width,channels] = size(GT);
left = x-floor(width/multiple/2);
right = left+ceil(width/multiple)-1;
top = y-floor(height/multiple/2);
bottom = top+ceil(height/multiple)-1;
if left<=0
    left = 1;
    right = ceil(width/multiple);
end
if right>width
    right = width;
    left = width-floor(width/multiple);
end
if top<=0
    top = 1;
    bottom = ceil(height/multiple);
end
if bottom>height
    bottom = height;
    top = height-floor(height/multiple);
end
switch channels
    case 1
        im = im2double(GT(top:bottom,left:right,1:1));
        a = ones(multiple,multiple);
        img = kron(im,a);
    case 2
        im1 = im2double(GT(top:bottom,left:right,1:1));
        im2 = im2double(GT(top:bottom,left:right,2:2)); 
        a = ones(multiple,multiple);
        img1 = kron(im1,a);
        img2 = kron(im2,a);
        img = [img1;img2];
    case 3
        im1 = im2double(GT(top:bottom,left:right,1:1));
        im2 = im2double(GT(top:bottom,left:right,2:2)); 
        im3 = im2double(GT(top:bottom,left:right,3:3)); 
        a = ones(multiple,multiple);
        img1 = kron(im1,a);
        img2 = kron(im2,a);
        img3 = kron(im3,a);
        img = [img1;img2;img3];
end
img = img(1:height,1:width,1:channels);
return;
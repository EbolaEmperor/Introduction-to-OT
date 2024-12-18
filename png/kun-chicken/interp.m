A = imread("shape-1-1.png");
B = imread("shape-1-10.png");

for i = 0 : 9
    t = i / 9;
    s = sprintf("color%d.png", i);
    imwrite((1-t)*A + t*B, s);
end
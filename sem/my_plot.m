clc
clear variables
close all




disp(1);
maxIterations = 500;
gridSize = 1000;
xlim = [-0.748766713922161, -0.748766707771757];
ylim = [ 0.123640844894862, 0.123640851045266];
disp(2);
x = linspace(xlim(1),xlim(2),gridSize);
y = linspace(ylim(1),ylim(2),gridSize);
whos x y
disp(3)
[xGrid,yGrid] = meshgrid(x,y);
z0 = complex(xGrid,yGrid);
count = ones(size(z0));
disp(4)
z = z0;
for n = 0:maxIterations
 z = z.*z + z0;
 inside = abs(z) <= 2;
 count = count + inside;
end
count = log(count);
disp(5)
imagesc(x,y,count)
colormap([jet();flipud(jet());0 0 0]);
axis off

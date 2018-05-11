function displayOutput(albedo, height)
% NOTE: h x w is the size of the input images
% albedo: h x w matrix of albedo 
% height: h x w matrix of surface heights

% some cosmetic transformations to make 3D model look better

[hgt, wid] = size(height);
[X,Y] = meshgrid(1:wid, 1:hgt);
H = flipud(fliplr(height));
A = flipud(fliplr(albedo));

figure, imshow(albedo);
title('Albedo');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure;
% mesh(H, X, Y, A);
% axis equal;
% xlabel('Z')
% ylabel('X')
% zlabel('Y')
% 
% % Set viewing direction
% view(90,90)
% colormap(gray)
% set(gca, 'XDir', 'reverse')
% set(gca, 'XTick', []);
% set(gca, 'YTick', []);
% set(gca, 'ZTick', []);
% set(gcf,'units','points','position',[200,200,200,200])
% 
% figure;
% mesh(H, X, Y, A);
% axis equal;
% xlabel('Z')
% ylabel('X')
% zlabel('Y')
% 
% % Set viewing direction
% view(135,90)
% colormap(gray)
% set(gca, 'XDir', 'reverse')
% set(gca, 'XTick', []);
% set(gca, 'YTick', []);
% set(gca, 'ZTick', []);
% set(gcf,'units','points','position',[200,200,200,200])
% 
% figure;
% mesh(H, X, Y, A);
% axis equal;
% xlabel('Z')
% ylabel('X')
% zlabel('Y')
% 
% % Set viewing direction
% view(180,90)
% colormap(gray)
% set(gca, 'XDir', 'reverse')
% set(gca, 'XTick', []);
% set(gca, 'YTick', []);
% set(gca, 'ZTick', []);
% set(gcf,'units','points','position',[200,200,200,200])
% 
% figure;
% mesh(H, X, Y, A);
% axis equal;
% xlabel('Z')
% ylabel('X')
% zlabel('Y')
% 
% % Set viewing direction
% view(90,55)
% colormap(gray)
% set(gca, 'XDir', 'reverse')
% set(gca, 'XTick', []);
% set(gca, 'YTick', []);
% set(gca, 'ZTick', []);
% set(gcf,'units','points','position',[200,200,200,200])
% 
% figure;
% mesh(H, X, Y, A);
% axis equal;
% xlabel('Z')
% ylabel('X')
% zlabel('Y')
% 
% % Set viewing direction
% view(135,55)
% colormap(gray)
% set(gca, 'XDir', 'reverse')
% set(gca, 'XTick', []);
% set(gca, 'YTick', []);
% set(gca, 'ZTick', []);
% set(gcf,'units','points','position',[200,200,200,200])
% 
% figure;
% mesh(H, X, Y, A);
% axis equal;
% xlabel('Z')
% ylabel('X')
% zlabel('Y')
% 
% % Set viewing direction
% view(180,55)
% colormap(gray)
% set(gca, 'XDir', 'reverse')
% set(gca, 'XTick', []);
% set(gca, 'YTick', []);
% set(gca, 'ZTick', []);
% set(gcf,'units','points','position',[200,200,200,200])
% 
% figure;
% mesh(H, X, Y, A);
% axis equal;
% xlabel('Z')
% ylabel('X')
% zlabel('Y')
% 
% % Set viewing direction
% view(90,20)
% colormap(gray)
% set(gca, 'XDir', 'reverse')
% set(gca, 'XTick', []);
% set(gca, 'YTick', []);
% set(gca, 'ZTick', []);
% set(gcf,'units','points','position',[200,200,200,200])
% 
% figure;
% mesh(H, X, Y, A);
% axis equal;
% xlabel('Z')
% ylabel('X')
% zlabel('Y')
% 
% % Set viewing direction
% view(135,20)
% colormap(gray)
% set(gca, 'XDir', 'reverse')
% set(gca, 'XTick', []);
% set(gca, 'YTick', []);
% set(gca, 'ZTick', []);
% set(gcf,'units','points','position',[200,200,200,200])
% 
% figure;
% mesh(H, X, Y, A);
% axis equal;
% xlabel('Z')
% ylabel('X')
% zlabel('Y')
% 
% % Set viewing direction
% view(180,20)
% colormap(gray)
% set(gca, 'XDir', 'reverse')
% set(gca, 'XTick', []);
% set(gca, 'YTick', []);
% set(gca, 'ZTick', []);
% set(gcf,'units','points','position',[200,200,200,200])



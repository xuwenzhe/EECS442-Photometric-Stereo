function  heightMap = getSurface(surfaceNormals, method)
% GETSURFACE computes the surface depth from normals
%   HEIGHTMAP = GETSURFACE(SURFACENORMALS, IMAGESIZE, METHOD) computes
%   HEIGHTMAP from the SURFACENORMALS using various METHODs. 
%  
% Input:
%   SURFACENORMALS: height x width x 3 array of unit surface normals
%   METHOD: the intergration method to be used
%
% Output:
%   HEIGHTMAP: height map of object

% 2018-01-28 EECS 442 hw2
dhdx = -surfaceNormals(:,:,1)./surfaceNormals(:,:,3);
dhdy = -surfaceNormals(:,:,2)./surfaceNormals(:,:,3);

UNintegrability = integrabilityCheck(dhdy,dhdx)

tic
switch method
    case 'column'
        %%% implement this %%%
        % first go along the same row as the pixel along and then goes
        % vertically down to the pixel
        heightMap = hm_column(dhdy,dhdx);
    case 'row'
        %%% implement this %%%
        heightMap = hm_row(dhdy,dhdx);
    case 'average'
        %%% implement this %%%
        heightMap = 0.5*(hm_column(dhdy,dhdx) + hm_row(dhdy,dhdx));
    case 'random'
        %%% implement this %%%
        heightMap = hm_random(dhdy,dhdx);
end
toc


function hm = hm_column(dhdy,dhdx)
[h,w] = size(dhdy);
hm = zeros(h,w);
startr = h/2;
startc = w/2;
for j = startc+1:w
    hm(startr,j) = hm(startr,j-1) + dhdx(startr,j-1);
end
for j = startc-1:-1:1
    hm(startr,j) = hm(startr,j+1) - dhdx(startr,j);
end
for i = startr+1:h
    hm(i,:) = hm(i-1,:) + dhdy(i-1,:);
end
for i = startr-1:-1:1
    hm(i,:) = hm(i+1,:) - dhdy(i,:);
end


function hm = hm_row(dhdy,dhdx)
[h,w] = size(dhdy);
hm = zeros(h,w);
startr = h/2;
startc = w/2;
for i = startr+1:h
    hm(i,startc) = hm(i-1,startc) + dhdy(i-1,startc);
end
for i = startr-1:-1:1
    hm(i,startc) = hm(i+1,startc) - dhdy(i,startc);
end
for j = startc+1:w
    hm(:,j) = hm(:,j-1) + dhdx(:,j-1);
end
for j = startc-1:-1:1
    hm(:,j) = hm(:,j+1) - dhdx(:,j);
end


function hm = hm_random(dhdy,dhdx)
[h,w] = size(dhdy);
% hm 1 start from 1,1
hm1 = zeros(h,w);
for j = 2:w
    hm1(1,j) = hm1(1,j-1) + dhdx(1,j-1);
end
for i = 2:h
    hm1(i,1) = hm1(i-1,1) + dhdy(i-1,1);
end
for i = 2:h
    for j = 2:w
        hm1(i,j) = 0.5*(hm1(i-1,j) + hm1(i,j-1)) + ...
            0.25*(dhdy(i-1,j)+dhdy(i,j)+dhdx(i,j-1)+dhdx(i,j));
    end
end
% hm2 start from 1,end
hm2 = zeros(h,w);
for j = w-1:-1:1
    hm2(1,j) = hm2(1,j+1) - dhdx(1,j+1);
end
for i = 2:h
    hm2(i,w) = hm2(i-1,w) + dhdy(i-1,w);
end
for i = 2:h
    for j = w-1:-1:1
        hm2(i,j) = 0.5*(hm2(i-1,j) + hm2(i,j+1)) + ...
            0.25*(dhdy(i-1,j)+dhdy(i,j)-dhdx(i,j+1)-dhdx(i,j));
    end
end
hm = 0.25*(hm1 + hm2 + hm_row(dhdy,dhdx) + hm_column(dhdy,dhdx));


function UNintegrability = integrabilityCheck(dhdy,dhdx)
[h,w] = size(dhdy);

test1 = zeros(h-2,w-2);
test2 = zeros(h-2,w-2);
for i = 2:h-1
    for j = 2:w-1
        test1(i,j) = (dhdx(i+1,j)-dhdx(i-1,j))/2;
        test2(i,j) = (dhdy(i,j+1)-dhdy(i,j-1))/2;
    end
end
testimg = (test1-test2).^2;
UNintegrability = sum(sum(testimg))/(h-2)/(w-2);
% figure()
% imshow(testimg)
% set(gcf,'units','points','position',[500,500,150,150])




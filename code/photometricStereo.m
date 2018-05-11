function [albedoImage, surfaceNormals] = photometricStereo(imArray, lightDirs)
% PHOTOMETRICSTEREO compute intrinsic image decomposition from images
%   [ALBEDOIMAGE, SURFACENORMALS] = PHOTOMETRICSTEREO(IMARRAY, LIGHTDIRS)
%   comptutes the ALBEDOIMAGE and SURFACENORMALS from an array of images
%   with their lighting directions. The surface is assumed to be perfectly
%   lambertian so that the measured intensity is proportional to the albedo
%   times the dot product between the surface normal and lighting
%   direction. The lights are assumed to be of unit intensity.
%
%   Input:
%       IMARRAY - [h w n] array of images, i.e., n images of size [h w]
%       LIGHTDIRS - [n 3] array of unit normals for the light directions
%
%   Output:
%        ALBEDOIMAGE - [h w] image specifying albedos
%        SURFACENORMALS - [h w 3] array of unit normals for each pixel
%
% Author: Subhransu Maji
%
% Acknowledgement: Based on a similar homework by Lana Lazebnik


%%% implement this %% 
% 2018-01-28 EECS442 hw2

% For each pixel: i = kb = k rho N (dot) S  = rho N (dot) V
% Assume k = 1 and |V| = 1, and "rho N" is called vector "g"
% stacking the unknown vector "g" into [3 hw]
% Vg = I, solve g = V\I
% V size: [n 3] = lightDirs
% g size: [3 hw]
% I size: [n hw]

% pixel index map:

% 1 4
% 2 5  --> [1 2 3 4 5 6] for each image
% 3 6
[h,w,n] = size(imArray);
I = reshape(imArray,[h*w,n])';
g = lightDirs\I;
rho = sqrt(g(1,:).^2 + g(2,:).^2 + g(3,:).^2);
albedoImage = reshape(rho,[h,w]);
N = g./rho;
surfaceNormals = reshape(N',[h,w,3]);




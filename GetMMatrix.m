function [M, Iz, Mcolor] = GetMMatrix(db_images, templateFiduc, locs, R2, t2)
% Get the M matrix for a given directory.
%   Returns n (num_images) x p (num_pixels) matrix. Each entry is the
%   grayscale value.

db1 = db_images{1};

[I2, ~, Iz] = MakeFrontalFace(db1.im, db1.fiduc, templateFiduc, locs, R2, t2);
p = size(I2, 1)*size(I2, 2);
Iz = imrotate(Iz,-90);
num_images = size(db_images, 1);
M = zeros(num_images, p);
Mcolor = cell(num_images, 1);
tic
for i = 1:num_images
    db = db_images{i};
    I2 = im2double(...

        MakeFrontalFace(db.im, db.fiduc, templateFiduc, locs, R2, t2));
    Mcolor{i} = I2;
    M(i, :) = reshape(rgb2gray(I2), 1, []);
    

    if(mod(i, 10) == 1)
        i
        toc
        tic
    end
end
toc

end


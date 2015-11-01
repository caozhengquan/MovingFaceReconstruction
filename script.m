im = imread('./lfw/George_W_Bush/George_W_Bush_0010.jpg');
ptcloud = pcread('./faceplys/face_mesh_000306.ply');
locs = ptcloud.Location;
figure, showPointCloud(ptcloud);
[DETS,PTS,DESCS] = getFiducial(im);
q = zeros(2,9);
q = PTS(:,:,1);
re_rc= [34.9, 2.458, 1230];
re_lc = [37, -31.89, 1236];
le_rc = [45.4, -66.51, 1248];
le_lc = [41.24, -94.92, 1267];
n_right = [82.49, -29.01, 1227];
n_center = [80.5, -53.6, 1212];
n_left = [79.03, -71.2, 1240];
mouth_right = [105.5, -23.84, 1228];
mouth_left = [111.5, -72.14, 1251];
Q = [re_rc;re_lc;le_rc;le_lc;n_right;n_center;n_left;mouth_right;mouth_left];
Q_mean = mean(Q);
Q_bar = Q - repmat(mean(Q),[9 1]);
Q_bar = Q_bar';
q_mean = mean(q');
q = (q' - repmat(mean(q'),[9 1]))';
A = q*Q_bar'*inv(Q_bar*Q_bar');
temp = cross(A(1,:),A(2,:));
A = [A(1,:);A(2,:);temp];
[U,S,V] = svd(A);
R = U*V';
% Left eye (left corner:)
%
%
%
%
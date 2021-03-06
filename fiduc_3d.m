re_rc= [34.9, 2.458, 1230];
re_lc = [37, -31.89, 1236];
le_rc = [45.4, -66.51, 1248];
le_lc = [41.24, -94.92, 1267];
n_right = [82.49, -29.01, 1227];
n_center = [80.5, -53.6, 1212];
n_left = [79.03, -71.2, 1240];
mouth_right = [105.5, -23.84, 1228];
mouth_left = [111.5, -72.14, 1251];

% See FiducLocations.jpg. This was from testShowFiducNumbering script.
Q = [re_rc;re_lc;le_rc;le_lc;n_right;n_center;n_left;mouth_right;mouth_left];
save('init_model_Q.mat', 'Q', 're_rc', 're_lc',...
    'le_rc', 'le_lc', 'n_right', 'n_center', 'n_left', 'mouth_right',...
    'mouth_left')
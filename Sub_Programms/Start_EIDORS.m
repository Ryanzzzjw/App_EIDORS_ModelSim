function path = Start_EIDORS(path)

if nargin == 0
    if ismac
        % Code to run on Mac platform
    elseif isunix
        % Code to run on Linux platform
        path = '/usr/local/EIDORS/eidors/startup.m';
    elseif ispc;
        % Code to run on Windows platform
        path = 'C:\EIDORS\eidors\startup.m';
    else
        disp('Platform not supported')
    end
end

if ~exist(path)
    path = uigetfile('.m', 'Select File "startup.m" to run EIDORS');
    if isequal(path,0)
        warndlg('User selected Cancel: EIDORS not started');
        path = 'EIDORS not started';
        return
    end
end
if ~exist('show_fem')
    disp(['Starting EIDORS from path: ' path]);
    run(path);
    eidors_cache('cache_size', 2*1024^3 ); % 2 GB cache
else
    disp(['EIDORS already started']);
end






end


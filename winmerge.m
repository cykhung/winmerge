function winmerge(varargin)

%     FUNCTION: winmerge - Run Winmerge.
%
%       SYNTAX: winmerge(left, right);
%               winmerge(left, right, filtername);
%               winmerge(left, right, filtername, halt);
%
%  DESCRIPTION: Run Winmerge.
%
%        INPUT: - left (string)
%                   Left file or left directory.
%
%               - right (string)
%                   Right file or left directory.
%
%               - filtername (string)
%                   Winmerge filter name. This function will automatically add
%                   open and close double-quotes to the filtername. Optional. 
%                   Default = 'None'. Valid filternames are:
%                       'None'      - No filtering.
%                       'Kevin-SVN' - Filter .svn directory.
%
%               - halt (real double)
%                   Halt flag. Optional. Default = 0. Valid values are:
%                       0 - Matlab will not be halted.
%                       1 - Matlab will be halted.
%
%       OUTPUT: none.


%% Assign input arguments.
switch nargin
case 2
    filtername = 'None';
    halt = 0;
    [left, right] = deal(varargin{:});
case 3
    halt = 0;
    [left, right, filtername] = deal(varargin{:});
case 4
    [left, right, filtername, halt] = deal(varargin{:});
otherwise
    error('Invalid number of input arguments.');
end


%% Find WinMergeU.exe.
WinMergeU = fullfile(fileparts(mfilename('fullpath')), 'private', ...
    'winmerge-2.16.0.0', 'WinMergeU.exe');


%% Call winmerge.
switch halt
case 0
    halt_flag = '&';
case 1
    halt_flag = '';
otherwise
    error('Invalid halt.');
end
dos(sprintf('"%s" -f "%s" -r "%s" "%s" %s', ...
    WinMergeU, filtername, left, right, halt_flag));


end


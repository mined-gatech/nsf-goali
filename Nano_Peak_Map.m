%% Find peaks in Nano Indentation Curve
% This script finds the peaks in the following image.
close all;

imshow('nanopeakcurve.jpg')
yy = ylim;
ylim([35.5 yy(2)]) % Truncate image title
title('$$\frac{Standard Force}{Time}$$',...
    'Interpreter','latex', ...
    'Fontsize',16,...
    'VerticalAlignment','Top',...
    'HorizontalAlignment','Right');
drawnow
figure(gcf)

image_url = 'https://dl.dropboxusercontent.com/u/22455492/nanopeakcurve.jpg';
data_url = 'https://www.dropbox.com/s/9bpo41u4vmy2rli/CPTi_test_01.xlsx?dl=0';

%% Load Raw Excel Data

rawdata = xlsread('CPTi_test_01.xlsx');

%%
% Columns
% * Time (seconds)
% * Indentation Depth ( I dont know the units )
% * Standard Force (Newtons)

data = struct( ...
    'time', rawdata(:,1), ...
    'depth', rawdata(:,2), ...
    'force', rawdata(:,3) );

[ h(1)] = plot(data.time, data.force);
ax= gca;
grid on
set( h(1), 'Color', .5 * [ 1 1 1], ...
    'Marker','d', ...
    'MarkerSize',15 );
set(gca, 'Fontsize',14)
xlabel('Time $$(Seconds)$$', ...
    'Interpreter','latex', ...
    'Fontsize',16)
ylabel('Standard Force $$(Newtons)$$', ...
    'Interpreter','latex', ...
    'Fontsize',16)

title('Experimental Data')

if ~ishold( ax ) hold( ax ); end

set(gcf,'Position',get(0,'ScreenSize'))
drawnow

%% Peaks Finding
% * Design a Binary Filter
% * Make the Center Pixel in the Filter Equal to Zero
% * Dilate the Image with this Filter
% * Find positions where the Filtered Image is Less than the Original
% Signal
%
%% Design a Filter 
% Design a filter with a hole in the center.  This filter will be used for
% a Dilation filter.  The dilation filter finds the maximum value for the
% non-zero values in the filter and the zero value ignores the value of
% each original pixel.

dim = 1;
radius = 3; % filter radius;
% This filter radius can be used to adjust for noise.

% A linear filter
filter = ones( radius*2+1, 1);
% Put a hole in the center
filter( radius + 1 ) = 0;

data = setfield( data, ... 
    'dilate', imdilate( data.force, filter ) );

%% Find Peaks
% Peaks exist when the original data is greater than the dilated data.  The
% dilation filter ignores the original pixel value while computing the
% local maximum in a nearby region defined by the ones in the filter.

time_id = find( data.force > data.dilate );
data.peaks = data.time( time_id );

%%

% Plot the Dilated signal
grid off
set(h(1),'LineWidth',4);
h(2) = plot( ax, data.time, data.dilate );
set( h(2), 'Color', 'red', ...
    'Marker','.')
xx = xlim;
yy = ylim;

% Add Peak Markers
grids{1} = plot( ax, ...
    repmat( data.peaks, 1,2)', ...
    horzcat( zeros(size(data.peaks) ), ...
        data.force(ismember(data.time, data.peaks)) )' ...
    );

set( grids{1}, 'LineStyle', '--', ...
    'Color','black' )
% Zoom in on the image
xlim( [10485 10498] )
ylim( yy );

legend( [ h grids{1}(1)], 'Original Data', 'Dilated Data', 'Peak Locations' );
title({'Peaks exist when the Original Data is GREATER', ...
    'than the Dilated Data. (Exploded view for illustration)'} );

%% Peaks, Valleys, and the Entire Shebang
% Image erosion is the minimum compliment to image dilation.
% Valleys arise when the original signal is less that the eroded signal.

data = setfield( data, ... 
    'erode', imerode( data.force, filter ) );

time_id = find( data.force < data.erode );
data.valleys = data.time( time_id );

%%
% Plot everything

h(3) = plot( ax, data.time, data.erode );
set( h(2), 'Color', 'red', ...
    'Marker','.')

% The time vector is not unique.  This is required for illustration.

[b, ri] = ismember(data.time, data.valleys);
valleyforce = accumarray( ri+1, data.force, [], @max);

grids{2} = plot( ax, ...
    repmat( data.valleys, 1,2)', ...
    horzcat( zeros(size(data.valleys) ), ...
        valleyforce(2:end) )' ...
    );

set( grids{2}, 'LineStyle', ':', ...
    'Color','black' )


legend( [ h grids{1}(1) grids{2}(1)], ...
    'Original Data', ...
    'Dilated Data', ...
    'Eroded Data', ...
    'Peak Locations', ...
    'Valley Locations');
xlim(xx)

drawnow;
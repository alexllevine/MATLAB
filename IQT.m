% Standard image quality metrics for object detection
standard_sharpness = 10; % This is a placeholder value
standard_contrast = 10; % This is a placeholder value
standard_brightness = 128; % This is a placeholder value
standard_noise = 0; % This is a placeholder value

standard_quality = struct('sharpness', standard_sharpness, 'contrast', standard_contrast, 'brightness', standard_brightness, 'noise', standard_noise);

% Function to compare image quality to standard quality
function differences = compare_to_standard(image_quality, standard_quality)
    differences = struct();
    metrics = fieldnames(image_quality);
    for i = 1:numel(metrics)
        metric = metrics{i};
        differences.(metric) = abs(image_quality.(metric) - standard_quality.(metric));
    end
end

% Function to assess image quality
function [sharpness, contrast, brightness, noise] = assess_image_quality(image_path)
    % Read the image
    img = imread(image_path);
    
    % Convert the image to grayscale
    gray_img = rgb2gray(img);
    
    % Calculate the sharpness using Laplacian method
    sharpness = var(double(imgradient(gray_img, 'central')));
    
    % Calculate contrast
    hist = imhist(gray_img);
    contrast = sum((hist - mean(hist)).^2);
    
    % Calculate brightness
    brightness = mean(gray_img(:));
    
    % Calculate noise using standard deviation
    noise = std(double(gray_img(:)));
end

% Directory containing images
image_folder = 'images/';

% List to store differences in quality metrics
differences_list = [];

% Get list of all JPG and PNG files in the folder
image_files = dir(fullfile(image_folder, '*.{jpg,png}'));
for i = 1:length(image_files)
    % Construct the full path to the image
    image_path = fullfile(image_folder, image_files(i).name);
    
    % Assess image quality
    [sharpness, contrast, brightness, noise] = assess_image_quality(image_path);
    
    % Calculate differences in quality metrics
    image_quality = struct('sharpness', sharpness, 'contrast', contrast, 'brightness', brightness, 'noise', noise);
    differences = compare_to_standard(image_quality, standard_quality);
    
    % Append differences to list
    differences_list = [differences_list; differences];
end

% Plotting
figure;
hold on;
metrics = fieldnames(differences_list);
for i = 1:numel(metrics)
    metric = metrics{i};
    plot([differences_list.(metric)], 'DisplayName', metric);
end
xlabel('Image Index');
ylabel('Difference from Standard');
title('Comparison of Image Quality Metrics to Standard');
legend();
grid on;
hold off;

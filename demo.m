% DEMO file for fast additive kernel classification.
%
%
% Based on the algorithm from : 
%
% Classification using Intersection Kernel SVMs is efficient, 
% Subhransu Maji, Alexander C. Berg, Jitendra Malik, CVPR 2008
%
% Author : Subhransu Maji         Date: Feb 1, 2010


% compile the mex files
if(exist('mex_linear_interpolate')~= 3 || ...
        exist('mex_sample_weighted_int_kernel')~= 3 || ...
            exist('mex_sample_weighted_kernel') ~= 3)
        make;
end

classes={...
        'aeroplane'
        'bicycle'
        'bird'
        'boat'
        'bottle'
        'bus'
        'car'
        'cat'
        'chair'
        'cow'
        'diningtable'
        'dog'
        'horse'
        'motorbike'
        'person'
        'pottedplant'
        'sheep'
        'sofa'
        'train'
        'tvmonitor'};

% path to the latest libsvm supported for additive kernels
libsvmpath = 'libsvm-mat-3.0-1';
datapath = 'dataset2';

addpath(libsvmpath);
addpath(datapath);

% loop over kernel types and train models
% KERNEL_TYPES = [5 6 7]; 
KERNEL_TYPES = 5; 

% train model 
% m = 500; n = 100; 
% x = rand(m,n);
% l = 2*(rand(m,1) > 0.5) -1;

% save toysample x l;
% load toysample;%
svmStruct = cell(20,1);

for k = 1:1
    filename =[ datapath '/' classes{k}];
    load (filename);

    x = [opSample;neSample];
    l =  datalabel;

    c =0.1:0.1:1.0;
%     a = 0.1:1.0;
%     c = 10;
%     a = 0.5;
    for m =1:length(c)
%         for n = 1:length(a)
            fprintf('\n\n\nTesting for KERNEL type : %i \n',KERNEL_TYPES);
            tic;
            svmmodel = svmtrain(l,x,sprintf('-t %i -b 1 -c %f -v %i',KERNEL_TYPES,c(m),5));
%             svmmodel = svmtrain(l,x,sprintf('-t %i -b 1 -c %f -a %f',KERNEL_TYPES,c,a));
%             svmmodel.beta = a;
            fprintf('%.2fs to train svm model\n',toc);

            % compute approximate model
    %         clear param;
    % 
    %         %number of samples for uniform sampling of the functions
    %         param.NSAMPLE = 100; 
    % 
    % 
    %         %BINARY SEARCH works only for intersection kernels
    % %         param.BINARY = 0; 
    % %         tic;
    % %         approxmodel1 = compute_approx_model(svmmodel,param);
    % %         fprintf('[binary %i] %.2fs \n',param.BINARY, toc);
    % 
    % 
    %         param.BINARY = 1; 
    %         tic;
    %         approxmodel2 = compute_approx_model(svmmodel,param);
    %         fprintf('[binary %i] %.2fs \n',param.BINARY, toc);
    % 
    %         %check if the models are similar (should be!)
    %     %     errorfa = max(max(abs(approxmodel1.fa - approxmodel2.fa)));
    % 
    %     %     fprintf('Error: %f \n\n\n',errorfa);
    % 
    %         % use this to predict the values
%             tic;
%             [svml,svmap,svmd] = svmpredict(l,x,svmmodel);
%             fprintf('%fs to predict values using LIBSVM.\n',toc);

    %         tic;
    %         d = svmpredict_approx(x, approxmodel2);
    %         fprintf('%fs to predict values using PWLApprox.\n',toc);
    % 
    %         fprintf('Error: %f\n\n',mean(abs(d-svmd)));

             % use this to predict the values

             % no need for predict values   
    %          tic;
    %         [svml,svmap,svmd] = svmpredict(l,x,svmmodel,'-b 1');
    %         fprintf('%fs to predict values using LIBSVM(prob).\n',toc);

    %         tic;
    %         d = svmpredict_approx(x, approxmodel1,1);
    %         fprintf('%fs to predict values using PWLApprox(prob).\n',toc);
    %         fprintf('Error(prob): %f\n\n',mean(mean(abs(d-svmd))));
        %     clear svmmodel approxmodel1 approxmodel2 param;
            Smodel(m).name = classes{k}; %#ok<*SAGROW>
            Smodel(m).model = svmmodel;
            
    %         Smodel.approximodel1 = approxmodel1;
    %         Smodel.approximodel2 = approxmodel2;


    %         clear Smodel svmmodel approximodel1 approximodel2;                     
%         end     
    end
    svmStruct{k} = Smodel;
    clear Smodel svmmodel;
end 

save svmStruct svmStruct;

clear;
clc;

%%read the input and output data
inputdata = xlsread('heart_disease_data.csv',1,'b1:o921');
outputdata = xlsread('heart_disease_data.csv',1,'p1:p921');

%transpose the matrix to ensure we have the samples correctly identified
inputdataTranspose = inputdata';
outputdataTranspose = outputdata';


%% get all the inputs gotten from physical test
age = input('how old are you?: ');
sex = input('sex => male(0) or female(1)?: ');
dataset = input('source of data => cleaveland(0), hungary(1), switzerland(2), van long beach(3)?: ');
cp = input('cp => typical angina(0, asymptotic(1), nonangina(2), atypical angina(3)?: ');
trestbps = input('trestbps measurement?: ');
chol = input('chol measurement?: ');
fbs = input('fbs => false(0), true(1)?: ');
restecg = input('restecg => hypertrophic(0), normal(1), stabnornaly(2) ?:');
thalch = input('thalch measurement?:');
exang = input('exang false(0), true(1) => ?: ');
oldpeak = input('oldpeak measurement?: ');
slope = input('slope => downslopping(0),flat(1), upslopping(2) ?:');
ca = input('ca measurement?: ');
thal = input('thal => fixed defect(0), normal(1), reversible(2) ?:');

%comment this out for now
simplefitInputs = [age sex dataset cp trestbps chol fbs restecg thalch exang oldpeak slope ca thal];



%use one of the dataset for a quick test
%simplefitInputs = inputdata(2,:);


%%




net = create_fit_net(inputdataTranspose,outputdataTranspose);
simplefitOutputs = sim(net,simplefitInputs');

%calculate the percentage of heart disease
finalresult = (simplefitOutputs/4)* 100;

disp('your result shows'); 
disp(finalresult);
disp('percent chance of having a heart disease');



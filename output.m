clc
clear all


%% Load data
% Change the filename here to the name of the file you would like to import
tree = loadMVNX('Task1-002 - wheel.mvnx');

% map= {'Pelvis T8','jL5S1','jL4L3','jL1T12','T9T8','T1C7','C8 head','C8 head','C1C2'  ,'C1C2','jLeftHip','jLeftKnee', 'left ankle','jLeftAnkle','left ball of foot','jRightHip','jRightKnee','right ankle','jRightAnkle','Right ball of foot','Right Shoulder', 'Right shoulder','Right shoulder','jRightShoulder','jRightElbow','Right wrist','jLeftC7Shoulder','Left shoulder','Left shoulder','jLeftShoulder','jLeftElbow','Left wrist','jLeftWrist' ,'left hand','left hand','left hand','left hand','right hand','right hand','right hand','right hand'}

newtree= struct( "Translation","Rotation","L5S1","L3L4","T12L1","T6T7","T1T2","C6C7","C4C5","Atlanto-Axial","Eyeside","LeftHip","LeftKnee","LeftAnkleRot","LeftAnkle","LeftToes","RightHip","RightKnee","RightAnkleRot","RightAnkle","RightToes","RightSC","RightAC","RightGH","RightShoulderRotation","RightElbow","RightWristRotation","LeftSC","LeftAC","LeftGH","LeftShoulderRotation","LeftElbow","LeftWristRotation","LeftWrist","Left_MiddleCarpal","Left_MiddleProximal","Left_IndexCarpal","Left_PinkyCarpal","Right_MiddleCarpal","Right_MiddleProximal","Right_IndexCarpal", "Right_PinkyCarpal");

%% mapping
% map= {'Pelvis T8','jL5S1','jL4L3','jL1T12','T9T8','T1C7','C8 head','C8 head','C1C2'  ,'C1C2','jLeftHip','jLeftKnee', 'left ankle','jLeftAnkle','left ball of foot','jRightHip','jRightKnee','right ankle','jRightAnkle','Right ball of foot','Right Shoulder', 'Right shoulder','Right shoulder','jRightShoulder','jRightElbow','Right wrist','jLeftC7Shoulder','Left shoulder','Left shoulder','jLeftShoulder','jLeftElbow','Left wrist','jLeftWrist' ,'left hand','left hand','left hand','left hand','right hand','right hand','right hand','right hand'}

%% Read some basic data from the file
mvnxVersion = tree.metaData.mvnx_version; % version of the MVN Studio used during recording
a = struct("Translation",tree.segmentData([1]),"Rotation",tree.segmentData([1]),"L5S1",tree.segmentData([2]),"L3L4",tree.segmentData([3]),"T12L1",tree.segmentData([4]),"T6T7",tree.segmentData([5]),"T1T2",tree.segmentData([6]),"C6C7",tree.segmentData([7]),"C4C5",tree.segmentData([7]),"Eyeside",tree.segmentData([7]),"LeftHip",tree.segmentData([]),"LeftKnee",tree.segmentData([21]),"LeftAnkleRot",tree.segmentData([21]),"LeftAnkle",tree.segmentData([22]),"LeftToes",tree.segmentData([23]),"RightHip",tree.segmentData([]),"RightKnee",tree.segmentData([17]),"RightAnkleRot",tree.segmentData([17]),"RightAnkle",tree.segmentData([18]),"RightToes",tree.segmentData([19]),"RightSC",tree.segmentData([8]),"RightAC",tree.segmentData([8]),"RightGH",tree.segmentData([8]),"RightShoulderRotation",tree.segmentData([8]),"RightElbow",tree.segmentData([9]),"RightWristRotation",tree.segmentData([10]),"LeftSC",tree.segmentData([12]),"LeftAC",tree.segmentData([12]),"LeftGH",tree.segmentData([12]),"LeftShoulderRotation",tree.segmentData([12]),"LeftElbow",tree.segmentData([13]),"LeftWristRotation",tree.segmentData([14]),"LeftWrist",tree.segmentData([15]),"Left_MiddleCarpal",tree.segmentData([15]),"Left_MiddleProximal",tree.segmentData([15]),"Left_IndexCarpal",tree.segmentData([15]),"Left_PinkyCarpal",tree.segmentData([15]),"Right_MiddleCarpal",tree.segmentData([11]),"Right_MiddleProximal",tree.segmentData([11]),"Right_IndexCarpal",tree.segmentData([11]), "Right_PinkyCarpal",tree.segmentData([11]));
%"Atlanto-Axial",tree.segmentData([7]) not working

%changing labels
a.Translation.label = "Translation";
a.Rotation.label= "Rotation";
a.L5S1.label= "L5S1";
a.L3L4.label= "L3L4";
a.T12L1.label= "T12L1";
a.T6T7.label= "T6T7";
a.T1T2.label= "T1T2";
a.C6C7.label= "C6C7";
a.C4C5.label= "C4C5";
% a.Atlanto-Axial.label ="Atlanto-Axial";
a.Eyeside.label= "Eyeside";
% a.LeftHip.label= "LeftHip";
a.LeftKnee.label= "LeftKnee";
a.LeftAnkleRot.label= "LeftAnkleRot";
a.LeftAnkle.label= "LeftAnkle";
a.LeftToes.label= "LeftToes";
% a.RightHip.label= "RightHip";
a.RightKnee.label= "RightKnee";
a.RightAnkleRot.label= "RightAnkleRot";
a.RightAnkle.label= "RightAnkle";
a.RightToes.label= "RightToes";
a.RightSC.label= "RightSC";
a.RightAC.label= "RightAC";
a.RightGH.label= "RightGH";
a.RightShoulderRotation.label= "RightShoulderRotation";
a.RightElbow.label= "RightElbow";
a.RightWristRotation.label= "RightWristRotation";
a.LeftSC.label= "LeftSC";
a.LeftAC.label= "LeftAC";
a.LeftGH.label= "LeftGH";
a.LeftShoulderRotation.label= "LeftShoulderRotation";
a.LeftElbow.label= "LeftElbow";
a.LeftWristRotation.label= "LeftWristRotation";
a.LeftWrist.label= "LeftWrist";
a.Left_MiddleCarpal.label= "Left_MiddleCarpal";
a.Left_MiddleProximal.label= "Left_MiddleProximal";
a.Left_IndexCarpal.label= "Left_IndexCarpal";
a.Left_PinkyCarpal.label= "Left_PinkyCarpal";
a.Right_MiddleCarpal.label= "Right_MiddleCarpal";
a.Right_MiddleProximal.label= "Right_MiddleProximal";
a.Right_IndexCarpal.label= "Right_IndexCarpal"; 
a.Right_PinkyCarpal.label= "Right_PinkyCarpal";

%% "Rotation","L5S1","L3L4","T12L1","T6T7","T1T2","C6C7","C4C5","Atlanto-Axial","Eyeside","LeftHip","LeftKnee","LeftAnkleRot","LeftAnkle","LeftToes","RightHip","RightKnee","RightAnkleRot","RightAnkle","RightToes","RightSC","RightAC","RightGH","RightShoulderRotation","RightElbow","RightWristRotation","LeftSC","LeftAC","LeftGH","LeftShoulderRotation","LeftElbow","LeftWristRotation","LeftWrist","Left_MiddleCarpal","Left_MiddleProximal","Left_IndexCarpal","Left_PinkyCarpal","Right_MiddleCarpal","Right_MiddleProximal","Right_IndexCarpal", "Right_PinkyCarpal") ;
% taking tx,ty,tz,r1x,r1y,r1z,r2x,r2y,r2z frm each joints

%Time = tree.frame([1],:);
% time_c = structfun(@(time)time.ms,Time)
%tree_trans= timeframe;
%  newTree.TimeStamp = tree.frame(1).ms;
% newTree.TimeStamp = tree.frame.ms([:]);

%%time stamping
%newTree.TimeStamp = {tree.frame.time};
TimeStamp = {tree.frame.time};
%  s=[tree.frame.time]/1000;
p= (TimeStamp([1],:));
h=str2double(p);
j= h/1000;
newTree.TimeStamp= j;


%%
newTree.Translation.tx = a.Translation.position(:,[1]);
newTree.Translation.ty= a.Translation.position(:,[2]);
newTree.Translation.tz = a.Translation.position(:,[3]);
newTree.Translation.r1x= a.Translation.velocity(:,[1]);
newTree.Translation.r1y= a.Translation.position(:,[2]);
newTree.Translation.r1z= a.Translation.velocity(:,[3]);
newTree.Translation.r2x= a.Translation.acceleration(:,[1]);
newTree.Translation.r2y= a.Translation.acceleration(:,[2]);
newTree.Translation.r2z= a.Translation.acceleration(:,[3]);
newTree.Translation.r3x= a.Translation.angularAcceleration(:,[1]);
newTree.Translation.r3y= a.Translation.angularAcceleration(:,[2]);
newTree.Translation.r3z= a.Translation.angularAcceleration(:,[3]);


newTree.Rotation.tx = a.Rotation.position(:,[1]);
newTree.Rotation.ty= a.Rotation.position(:,[2]);
newTree.Rotation.tz= a.Rotation.position(:,[3]);
newTree.Rotation.r1x= a.Rotation.velocity(:,[1]);
newTree.Rotation.r1y= a.Rotation.position(:,[2]);
newTree.Rotation.r1z= a.Rotation.velocity(:,[3]);
newTree.Rotation.r2x= a.Rotation.acceleration(:,[1]);
newTree.Rotation.r2y= a.Rotation.acceleration(:,[2]);
newTree.Rotation.r2z= a.Rotation.acceleration(:,[3]);
newTree.Rotation.r3x= a.Rotation.angularAcceleration(:,[1]);
newTree.Rotation.r3y= a.Rotation.angularAcceleration(:,[2]);
newTree.Rotation.r3z= a.Rotation.angularAcceleration(:,[3]);

newTree.L5S1.tx= a.L5S1.position(:,[1]);
newTree.L5S1.ty= a.L5S1.position(:,[2]);
newTree.L5S1.tz= a.L5S1.position(:,[3]);
newTree.L5S1.r1x= a.L5S1.velocity(:,[1]);
newTree.L5S1.r1y= a.L5S1.velocity(:,[2]);
newTree.L5S1.r1z= a.L5S1.velocity(:,[3]);
newTree.L5S1.r2x= a.L5S1.acceleration(:,[1]);
newTree.L5S1.r2y= a.L5S1.acceleration(:,[2]);
newTree.L5S1.r2z= a.L5S1.acceleration(:,[3]);
newTree.L5S1.r3x= a.L5S1.angularAcceleration(:,[1]);
newTree.L5S1.r3y= a.L5S1.angularAcceleration(:,[2]);
newTree.L5S1.r3z= a.L5S1.angularAcceleration(:,[3]);

%%

newTree.C4C5.tx= a.C4C5.position(:,[1]);
newTree.C4C5.ty= a.C4C5.position(:,[2]);
newTree.C4C5.tz= a.C4C5.position(:,[3]);
newTree.C4C5.r1x= a.C4C5.velocity(:,[1]);
newTree.C4C5.r1y= a.C4C5.velocity(:,[2]);
newTree.C4C5.r1z= a.C4C5.velocity(:,[3]); 
newTree.C4C5.r2x= a.C4C5.acceleration(:,[1]);
newTree.C4C5.r2y= a.C4C5.acceleration(:,[2]);
newTree.C4C5.r2z= a.C4C5.acceleration(:,[3]);
newTree.C4C5.r3x= a.C4C5.angularAcceleration(:,[1]);
newTree.C4C5.r3y= a.C4C5.angularAcceleration(:,[2]);
newTree.C4C5.r3z= a.C4C5.angularAcceleration(:,[3]);


newTree.Eyeside.tx= a.Eyeside.position(:,[1]);
newTree.Eyeside.ty= a.Eyeside.position(:,[2]);
newTree.Eyeside.tz= a.Eyeside.position(:,[3]);
newTree.Eyeside.r1x= a.Eyeside.velocity(:,[1]);
newTree.Eyeside.r1y= a.Eyeside.velocity(:,[2]);
newTree.Eyeside.r1z= a. Eyeside.velocity(:,[3]);
newTree.Eyeside.r2x= a.Eyeside.acceleration(:,[1]);
newTree.Eyeside.r2y= a.Eyeside.acceleration(:,[2]);
newTree.Eyeside.r2z= a.Eyeside.acceleration(:,[3]);
newTree.Eyeside.r3x= a.Eyeside.angularAcceleration(:,[1]);
newTree.Eyeside.r3y= a.Eyeside.angularAcceleration(:,[2]);
newTree.Eyeside.r3z= a.Eyeside.angularAcceleration(:,[3]);

%%
newTree.LeftKnee.tx= a.LeftKnee.position(:,[1]);
newTree.LeftKnee.ty= a.LeftKnee.position(:,[2]); 
newTree.LeftKnee.tz= a.LeftKnee.position(:,[3]);
newTree.LeftKnee.r1x= a.LeftKnee.velocity(:,[1]);
newTree.LeftKnee.r1y= a.LeftKnee.velocity(:,[2]);
newTree.LeftKnee.r1z= a.LeftKnee.velocity(:,[3]);
newTree.LeftKnee.r2x= a.LeftKnee.acceleration(:,[1]);
newTree.LeftKnee.r2y= a.LeftKnee.acceleration(:,[2]);
newTree.LeftKnee.r2z= a.LeftKnee.acceleration(:,[3]);
newTree.LeftKnee.r3x= a.LeftKnee.angularAcceleration(:,[1]);
newTree.LeftKnee.r3y= a.LeftKnee.angularAcceleration(:,[2]);
newTree.LeftKnee.r3z= a.LeftKnee.angularAcceleration(:,[3]);


newTree.LeftAnkleRot.tx= a.LeftAnkleRot.position(:,[1]);
newTree.LeftAnkleRot.ty= a.LeftAnkleRot.position(:,[2]);
newTree.LeftAnkleRot.tz= a.LeftAnkleRot.position(:,[3]); 
newTree.LeftAnkleRot.r1x= a.LeftAnkleRot.velocity(:,[1]); 
newTree.LeftAnkleRot.r1y= a.LeftAnkleRot.velocity(:,[2]);
newTree.LeftAnkleRot.r1z= a.LeftAnkleRot.velocity(:,[3]); 
newTree.LeftAnkleRot.r2x= a.LeftAnkleRot.acceleration(:,[1]);
newTree.LeftAnkleRot.r2y= a.LeftAnkleRot.acceleration(:,[2]);
newTree.LeftAnkleRot.r2z= a.LeftAnkleRot.acceleration(:,[3]);
newTree.LeftAnkleRot.r3x= a.LeftAnkleRot.angularAcceleration(:,[1]);
newTree.LeftAnkleRot.r3y= a.LeftAnkleRot.angularAcceleration(:,[2]);
newTree.LeftAnkleRot.r3z= a.LeftAnkleRot.angularAcceleration(:,[3]);


newTree.LeftAnkle.tx= a.LeftAnkle.position(:,[1]);
newTree.LeftAnkle.ty= a.LeftAnkle.position(:,[2]);
newTree.LeftAnkle.tz= a.LeftAnkle.position(:,[3]);
newTree.LeftAnkle.r1x= a.LeftAnkle.velocity(:,[1]);
newTree.LeftAnkle.r1y= a.LeftAnkle.velocity(:,[2]);
newTree.LeftAnkle.r1z= a.LeftAnkle.velocity(:,[3]);
newTree.LeftAnkle.r2x= a.LeftAnkle.acceleration(:,[1]);
newTree.LeftAnkle.r2y= a.LeftAnkle.acceleration(:,[2]);
newTree.LeftAnkle.r2z= a.LeftAnkle.acceleration(:,[3]);
newTree.LeftAnkle.r3x= a.LeftAnkle.angularAcceleration(:,[1]);
newTree.LeftAnkle.r3y= a.LeftAnkle.angularAcceleration(:,[2]);
newTree.LeftAnkle.r3z= a.LeftAnkle.angularAcceleration(:,[3]);


newTree.LeftToes.tx= a.LeftToes.position(:,[1]);
newTree.LeftToes.ty= a.LeftToes.position(:,[2]); 
newTree.LeftToes.tz= a.LeftToes.position(:,[3]);
newTree.LeftToes.r1x= a.LeftToes.velocity(:,[1]);
newTree.LeftToes.r1y= a.LeftToes.velocity(:,[2]);
newTree.LeftToes.r1z= a.LeftToes.velocity(:,[3]);
newTree.LeftToes.r2x= a.LeftToes.acceleration(:,[1]);
newTree.LeftToes.r2y= a.LeftToes.acceleration(:,[2]);
newTree.LeftToes.r2z= a.LeftToes.acceleration(:,[3]);
newTree.LeftToes.r3x= a.LeftToes.angularAcceleration(:,[1]);
newTree.LeftToes.r3y= a.LeftToes.angularAcceleration(:,[2]);
newTree.LeftToes.r3z= a.LeftToes.angularAcceleration(:,[3]);

newTree.RightKnee.tx= a.RightKnee.position(:,[1]);
newTree.RightKnee.ty= a.RightKnee.position(:,[2]);
newTree.RightKnee.tz= a.RightKnee.position(:,[3]);
newTree.RightKnee.r1x= a.RightKnee.velocity(:,[1]);
newTree.RightKnee.r1y= a.RightKnee.velocity(:,[2]);
newTree.RightKnee.r1z= a.RightKnee.velocity(:,[3]);
newTree.RightKnee.r2x= a.RightKnee.acceleration(:,[1]);
newTree.RightKnee.r2y= a.RightKnee.acceleration(:,[2]);
newTree.RightKnee.r2z= a.RightKnee.acceleration(:,[3]);
newTree.RightKnee.r3x= a.RightKnee.angularAcceleration(:,[1]);
newTree.RightKnee.r3y= a.RightKnee.angularAcceleration(:,[2]);
newTree.RightKnee.r3z= a.RightKnee.angularAcceleration(:,[3]);

newTree.RightAnkleRot.tx= a.RightAnkleRot.position(:,[1]);
newTree.RightAnkleRot.ty= a.RightAnkleRot.position(:,[2]);
newTree.RightAnkleRot.tz= a.RightAnkleRot.position(:,[3]);
newTree.RightAnkleRot.r1x= a.RightAnkleRot.velocity(:,[1]);
newTree.RightAnkleRot.r1y= a.RightAnkleRot.velocity(:,[2]);
newTree.RightAnkleRot.r1z= a.RightAnkleRot.velocity(:,[3]);
newTree.RightAnkleRot.r2x= a.RightAnkleRot.acceleration(:,[1]);
newTree.RightAnkleRot.r2y= a.RightAnkleRot.acceleration(:,[2]);
newTree.RightAnkleRot.r2z= a.RightAnkleRot.acceleration(:,[3]);
newTree.RightAnkleRot.r3x= a.RightAnkleRot.angularAcceleration(:,[1]);
newTree.RightAnkleRot.r3y= a.RightAnkleRot.angularAcceleration(:,[2]);
newTree.RightAnkleRot.r3z= a.RightAnkleRot.angularAcceleration(:,[3]);

newTree.RightAnkle.tx= a.RightAnkle.position(:,[1]);
newTree.RightAnkle.ty= a.RightAnkle.position(:,[2]);
newTree.RightAnkle.tz= a.RightAnkle.position(:,[3]);
newTree.RightAnkle.r1x= a.RightAnkle.velocity(:,[1]);
newTree.RightAnkle.r1y= a.RightAnkle.velocity(:,[2]);
newTree.RightAnkle.r1z= a.RightAnkle.velocity(:,[3]);
newTree.RightAnkle.r2x= a.RightAnkle.acceleration(:,[1]);
newTree.RightAnkle.r2y= a.RightAnkle.acceleration(:,[2]);
newTree.RightAnkle.r2z= a.RightAnkle.acceleration(:,[3]);
newTree.RightAnkle.r3x= a.RightAnkle.angularAcceleration(:,[1]);
newTree.RightAnkle.r3y= a.RightAnkle.angularAcceleration(:,[2]);
newTree.RightAnkle.r3z= a.RightAnkle.angularAcceleration(:,[3]);

newTree.RightToes.tx= a.RightToes.position(:,[1]);
newTree.RightToes.ty= a.RightToes.position(:,[2]);
newTree.RightToes.tz= a.RightToes.position(:,[3]);
newTree.RightToes.r1x= a.RightToes.velocity(:,[1]);
newTree.RightToes.r1y= a.RightToes.velocity(:,[2]);
newTree.RightToes.r1z= a.RightToes.velocity(:,[3]);
newTree.RightToes.r2x= a.RightToes.acceleration(:,[1]);
newTree.RightToes.r2y= a.RightToes.acceleration(:,[2]);
newTree.RightToes.r2z= a.RightToes.acceleration(:,[3]);
newTree.RightToes.r3x= a.RightToes.angularAcceleration(:,[1]);
newTree.RightToes.r3y= a.RightToes.angularAcceleration(:,[2]);
newTree.RightToes.r3z= a.RightToes.angularAcceleration(:,[3]);

newTree.RightSC.tx= a.RightSC.position(:,[1]);
newTree.RightSC.ty= a.RightSC.position(:,[2]);
newTree.RightSC.tz= a.RightSC.position(:,[3]);
newTree.RightSC.r1x= a.RightSC.velocity(:,[1]);
newTree.RightSC.r1y= a.RightSC.velocity(:,[2]);
newTree.RightSC.r1z= a.RightSC.velocity(:,[3]);
newTree.RightSC.r2x= a.RightSC.acceleration(:,[1]);
newTree.RightSC.r2y= a.RightSC.acceleration(:,[2]);
newTree.RightSC.r2z= a.RightSC.acceleration(:,[3]);
newTree.RightSC.r3x= a.RightSC.angularAcceleration(:,[1]);
newTree.RightSC.r3y= a.RightSC.angularAcceleration(:,[2]);
newTree.RightSC.r3z= a.RightSC.angularAcceleration(:,[3]);

%%
newTree.RightAC.tx= a.RightAC.position(:,[1]);
newTree.RightAC.ty= a.RightAC.position(:,[2]);
newTree.RightAC.tz= a.RightAC.position(:,[3]);
newTree.RightAC.r1x= a.RightAC.velocity(:,[1]);
newTree.RightAC.r1y= a.RightAC.velocity(:,[2]);
newTree.RightAC.r1z= a.RightAC.velocity(:,[3]);
newTree.RightAC.r2x= a.RightAC.acceleration(:,[1]);
newTree.RightAC.r2y= a.RightAC.acceleration(:,[2]);
newTree.RightAC.r2z= a.RightAC.acceleration(:,[3]);
newTree.RightAC.r3x= a.RightAC.angularAcceleration(:,[1]);
newTree.RightAC.r3y= a.RightAC.angularAcceleration(:,[2]);
newTree.RightAC.r3z= a.RightAC.angularAcceleration(:,[3]);

newTree.RightGH.tx= a.RightGH.position(:,[1]);
newTree.RightGH.ty= a.RightGH.position(:,[2]);
newTree.RightGH.tz= a.RightGH.position(:,[3]);
newTree.RightGH.r1x= a.RightGH.velocity(:,[1]);
newTree.RightGH.r1y= a.RightGH.velocity(:,[2]);
newTree.RightGH.r1z= a.RightGH.velocity(:,[3]);
newTree.RightGH.r2x= a.RightGH.acceleration(:,[1]);
newTree.RightGH.r2y= a.RightGH.acceleration(:,[2]);
newTree.RightGH.r2z= a.RightGH.acceleration(:,[3]);
newTree.RightGH.r3x= a.RightGH.angularAcceleration(:,[1]);
newTree.RightGH.r3y= a.RightGH.angularAcceleration(:,[2]);
newTree.RightGH.r3z= a.RightGH.angularAcceleration(:,[3]);

newTree.RightShoulderRotation.tx= a.RightShoulderRotation.position(:,[1]);
newTree.RightShoulderRotation.ty= a.RightShoulderRotation.position(:,[2]);
newTree.RightShoulderRotation.tz= a.RightShoulderRotation.position(:,[3]);
newTree.RightShoulderRotation.r1x= a.RightShoulderRotation.velocity(:,[1]);
newTree.RightShoulderRotation.r1y= a.RightShoulderRotation.velocity(:,[2]);
newTree.RightShoulderRotation.r1z= a.RightShoulderRotation.velocity(:,[3]);
newTree.RightShoulderRotation.r2x= a.RightShoulderRotation.acceleration(:,[1]);
newTree.RightShoulderRotation.r2y= a.RightShoulderRotation.acceleration(:,[2]);
newTree.RightShoulderRotation.r2z= a.RightShoulderRotation.acceleration(:,[3]);
newTree.RightShoulderRotation.r3x= a.RightShoulderRotation.angularAcceleration(:,[1]);
newTree.RightShoulderRotation.r3y= a.RightShoulderRotation.angularAcceleration(:,[2]);
newTree.RightShoulderRotation.r3z= a.RightShoulderRotation.angularAcceleration(:,[3]);


newTree.RightElbow.tx= a.RightElbow.position(:,[1]);
newTree.RightElbow.ty= a.RightElbow.position(:,[2]);
newTree.RightElbow.tz= a.RightElbow.position(:,[3]);
newTree.RightElbow.r1x= a.RightElbow.velocity(:,[1]);
newTree.RightElbow.r1y= a.RightElbow.velocity(:,[2]);
newTree.RightElbow.r1z= a.RightElbow.velocity(:,[3]);
newTree.RightElbow.r2x= a.RightElbow.acceleration(:,[1]);
newTree.RightElbow.r2y= a.RightElbow.acceleration(:,[2]); 
newTree.RightElbow.r2z= a.RightElbow.acceleration(:,[3]);
newTree.RightElbow.r3x= a.RightElbow.angularAcceleration(:,[1]);
newTree.RightElbow.r3y= a.RightElbow.angularAcceleration(:,[2]);
newTree.RightElbow.r3z= a.RightElbow.angularAcceleration(:,[3]);

newTree.RightWristRotation.tx= a.RightWristRotation.position(:,[1]);
newTree.RightWristRotation.ty= a.RightWristRotation.position(:,[2]);
newTree.RightWristRotation.tz= a.RightWristRotation.position(:,[3]);
newTree.RightWristRotation.r1x= a.RightWristRotation.velocity(:,[1]);
newTree.RightWristRotation.r1y= a.RightWristRotation.velocity(:,[2]);
newTree.RightWristRotation.r1z= a.RightWristRotation.velocity(:,[3]);
newTree.RightWristRotation.r2x= a.RightWristRotation.acceleration(:,[1]);
newTree.RightWristRotation.r2y= a.RightWristRotation.acceleration(:,[2]);
newTree.RightWristRotation.r2z= a.RightWristRotation.acceleration(:,[3]);
newTree.RightWristRotation.r3x= a.RightWristRotation.angularAcceleration(:,[1]);
newTree.RightWristRotation.r3y= a.RightWristRotation.angularAcceleration(:,[2]);
newTree.RightWristRotation.r3z= a.RightWristRotation.angularAcceleration(:,[3]);


newTree.LeftSC.tx= a.LeftSC.position(:,[1]);
newTree.LeftSC.ty= a.LeftSC.position(:,[2]);
newTree.LeftSC.tz= a.LeftSC.position(:,[3]);
newTree.LeftSC.r1x= a.LeftSC.velocity(:,[1]);
newTree.LeftSC.r1y= a.LeftSC.velocity(:,[2]);
newTree.LeftSC.r1z= a.LeftSC.velocity(:,[3]);
newTree.LeftSC.r2x= a.LeftSC.acceleration(:,[1]);
newTree.LeftSC.r2y= a.LeftSC.acceleration(:,[2]);
newTree.LeftSC.r2z= a.LeftSC.acceleration(:,[3]);
newTree.LeftSC.r3x= a.LeftSC.angularAcceleration(:,[1]);
newTree.LeftSC.r3y= a.LeftSC.angularAcceleration(:,[2]);
newTree.LeftSC.r3z= a.LeftSC.angularAcceleration(:,[3]);

newTree.LeftAC.tx= a.LeftAC.position(:,[1]);
newTree.LeftAC.ty= a.LeftAC.position(:,[2]);
newTree.LeftAC.tz= a.LeftAC.position(:,[3]);
newTree.LeftAC.r1x= a.LeftAC.velocity(:,[1]);
newTree.LeftAC.r1y= a.LeftAC.velocity(:,[2]);
newTree.LeftAC.r1z= a.LeftAC.velocity(:,[3]);
newTree.LeftAC.r2x= a.LeftAC.acceleration(:,[1]);
newTree.LeftAC.r2y= a.LeftAC.acceleration(:,[2]);
newTree.LeftAC.r2z= a.LeftAC.acceleration(:,[3]);
newTree.LeftAC.r3x= a.LeftAC.angularAcceleration(:,[1]);
newTree.LeftAC.r3y= a.LeftAC.angularAcceleration(:,[2]);
newTree.LeftAC.r3z= a.LeftAC.angularAcceleration(:,[3]);


newTree.LeftGH.tx= a.LeftGH.position(:,[1]);
newTree.LeftGH.ty= a.LeftGH.position(:,[2]);
newTree.LeftGH.tz= a.LeftGH.position(:,[3]);
newTree.LeftGH.r1x= a.LeftGH.velocity(:,[1]);
newTree.LeftGH.r1y= a.LeftGH.velocity(:,[2]);
newTree.LeftGH.r1z= a.LeftGH.velocity(:,[3]);
newTree.LeftGH.r2x= a.LeftGH.acceleration(:,[1]);
newTree.LeftGH.r2y= a.LeftGH.acceleration(:,[2]);
newTree.LeftGH.r2z= a.LeftGH.acceleration(:,[3]);
newTree.LeftGH.r3x= a.LeftGH.angularAcceleration(:,[1]);
newTree.LeftGH.r3y= a.LeftGH.angularAcceleration(:,[2]);
newTree.LeftGH.r3z= a.LeftGH.angularAcceleration(:,[3]);

newTree.LeftShoulderRotation.tx= a.LeftShoulderRotation.position(:,[1]);
newTree.LeftShoulderRotation.ty= a.LeftShoulderRotation.position(:,[2]);
newTree.LeftShoulderRotation.tz= a.LeftShoulderRotation.position(:,[3]);
newTree.LeftShoulderRotation.r1x= a.LeftShoulderRotation.velocity(:,[1]);
newTree.LeftShoulderRotation.r1y= a.LeftShoulderRotation.velocity(:,[2]);
newTree.LeftShoulderRotation.r1z= a.LeftShoulderRotation.velocity(:,[3]);
newTree.LeftShoulderRotation.r2x= a.LeftShoulderRotation.acceleration(:,[1]);
newTree.LeftShoulderRotation.r2y= a.LeftShoulderRotation.acceleration(:,[2]);
newTree.LeftShoulderRotation.r2z= a.LeftShoulderRotation.acceleration(:,[3]);
newTree.LeftShoulderRotation.r3x= a.LeftShoulderRotation.angularAcceleration(:,[1]);
newTree.LeftShoulderRotation.r3y= a.LeftShoulderRotation.angularAcceleration(:,[2]);
newTree.LeftShoulderRotation.r3z= a.LeftShoulderRotation.angularAcceleration(:,[3]);


newTree.LeftElbow.tx= a.LeftElbow.position(:,[1]);
newTree.LeftElbow.ty= a.LeftElbow.position(:,[2]);
newTree.LeftElbow.tz= a.LeftElbow.position(:,[3]);
newTree.LeftElbow.r1x= a.LeftElbow.velocity(:,[1]);
newTree.LeftElbow.r1y= a.LeftElbow.velocity(:,[2]);
newTree.LeftElbow.r1z= a.LeftElbow.velocity(:,[3]);
newTree.LeftElbow.r2x= a.LeftElbow.acceleration(:,[1]);
newTree.LeftElbow.r2y= a.LeftElbow.acceleration(:,[2]);
newTree.LeftElbow.r2z= a.LeftElbow.acceleration(:,[3]);
newTree.LeftElbow.r3x= a.LeftElbow.angularAcceleration(:,[1]);
newTree.LeftElbow.r3y= a.LeftElbow.angularAcceleration(:,[2]);
newTree.LeftElbow.r3z= a.LeftElbow.angularAcceleration(:,[3]);


newTree.LeftWristRotation.tx= a.LeftWristRotation.position(:,[1]);
newTree.LeftWristRotation.ty= a.LeftWristRotation.position(:,[2]);
newTree.LeftWristRotation.tz= a.LeftWristRotation.position(:,[3]);
newTree.LeftWristRotation.r1x= a.LeftWristRotation.velocity(:,[1]);
newTree.LeftWristRotation.r1y= a.LeftWristRotation.velocity(:,[2]);
newTree.LeftWristRotation.r1z= a.LeftWristRotation.velocity(:,[3]);
newTree.LeftWristRotation.r2x= a.LeftWristRotation.acceleration(:,[1]);
newTree.LeftWristRotation.r2y= a.LeftWristRotation.acceleration(:,[2]);
newTree.LeftWristRotation.r2z= a.LeftWristRotation.acceleration(:,[3]);
newTree.LeftWristRotation.r3x= a.LeftWristRotation.angularAcceleration(:,[1]);
newTree.LeftWristRotation.r3y= a.LeftWristRotation.angularAcceleration(:,[2]);
newTree.LeftWristRotation.r3z= a.LeftWristRotation.angularAcceleration(:,[3]);


newTree.LeftWrist.tx= a.LeftWrist.position(:,[1]);
newTree.LeftWrist.ty= a.LeftWrist.position(:,[2]);
newTree.LeftWrist.tz= a.LeftWrist.position(:,[3]);
newTree.LeftWrist.r1x= a.LeftWrist.velocity(:,[1]);
newTree.LeftWrist.r1y= a.LeftWrist.velocity(:,[2]);
newTree.LeftWrist.r1z= a.LeftWrist.velocity(:,[3]);
newTree.LeftWrist.r2x= a.LeftWrist.acceleration(:,[1]);
newTree.LeftWrist.r2y= a.LeftWrist.acceleration(:,[2]);
newTree.LeftWrist.r2z= a.LeftWrist.acceleration(:,[3]);
newTree.LeftWrist.r3x= a.LeftWrist.angularAcceleration(:,[1]);
newTree.LeftWrist.r3y= a.LeftWrist.angularAcceleration(:,[2]);
newTree.LeftWrist.r3z= a.LeftWrist.angularAcceleration(:,[3]);


newTree.Left_MiddleCarpal.tx= a.Left_MiddleCarpal.position(:,[1]);
newTree.Left_MiddleCarpal.ty= a.Left_MiddleCarpal.position(:,[2]);
newTree.Left_MiddleCarpal.tz= a.Left_MiddleCarpal.position(:,[3]);
newTree.Left_MiddleCarpal.r1x= a.Left_MiddleCarpal.velocity(:,[1]);
newTree.Left_MiddleCarpal.r1y= a.Left_MiddleCarpal.velocity(:,[2]);
newTree.Left_MiddleCarpal.r1z= a.Left_MiddleCarpal.velocity(:,[3]);
newTree.Left_MiddleCarpal.r2x= a.Left_MiddleCarpal.acceleration(:,[1]);
newTree.Left_MiddleCarpal.r2y= a.Left_MiddleCarpal.acceleration(:,[2]);
newTree.Left_MiddleCarpal.r2z= a.Left_MiddleCarpal.acceleration(:,[3]);
newTree.Left_MiddleCarpal.r3x= a.Left_MiddleCarpal.angularAcceleration(:,[1]);
newTree.Left_MiddleCarpal.r3y= a.Left_MiddleCarpal.angularAcceleration(:,[2]);
newTree.Left_MiddleCarpal.r3z= a.Left_MiddleCarpal.angularAcceleration(:,[3]);


newTree.Left_MiddleProximal.tx= a.Left_MiddleProximal.position(:,[1]);
newTree.Left_MiddleProximal.ty= a.Left_MiddleProximal.position(:,[2]);
newTree.Left_MiddleProximal.tz= a.Left_MiddleProximal.position(:,[3]);
newTree.Left_MiddleProximal.r1x= a.Left_MiddleProximal.velocity(:,[1]);
newTree.Left_MiddleProximal.r1y= a.Left_MiddleProximal.velocity(:,[2]);
newTree.Left_MiddleProximal.r1z= a.Left_MiddleProximal.velocity(:,[3]);
newTree.Left_MiddleProximal.r2x= a.Left_MiddleProximal.acceleration(:,[1]);
newTree.Left_MiddleProximal.r2y= a.Left_MiddleProximal.acceleration(:,[2]);
newTree.Left_MiddleProximal.r2z= a.Left_MiddleProximal.acceleration(:,[3]);
newTree.Left_MiddleProximal.r3x= a.Left_MiddleProximal.angularAcceleration(:,[1]);
newTree.Left_MiddleProximal.r3y= a.Left_MiddleProximal.angularAcceleration(:,[2]);
newTree.Left_MiddleProximal.r3z= a.Left_MiddleProximal.angularAcceleration(:,[3]);


newTree.Left_IndexCarpal.tx= a.Left_IndexCarpal.position(:,[1]);
newTree.Left_IndexCarpal.ty= a.Left_IndexCarpal.position(:,[2]);
newTree.Left_IndexCarpal.tz= a.Left_IndexCarpal.position(:,[3]);
newTree.Left_IndexCarpal.r1x= a.Left_IndexCarpal.velocity(:,[1]);
newTree.Left_IndexCarpal.r1y= a.Left_IndexCarpal.velocity(:,[2]);
newTree.Left_IndexCarpal.r1z= a.Left_IndexCarpal.velocity(:,[3]);
newTree.Left_IndexCarpal.r2x= a.Left_IndexCarpal.acceleration(:,[1]);
newTree.Left_IndexCarpal.r2y= a.Left_IndexCarpal.acceleration(:,[2]);
newTree.Left_IndexCarpal.r2z= a.Left_IndexCarpal.acceleration(:,[3]);
newTree.Left_IndexCarpal.r3x= a.Left_IndexCarpal.angularAcceleration(:,[1]);
newTree.Left_IndexCarpal.r3y= a.Left_IndexCarpal.angularAcceleration(:,[2]);
newTree.Left_IndexCarpal.r3z= a.Left_IndexCarpal.angularAcceleration(:,[3]);


newTree.Left_PinkyCarpal.tx= a.Left_PinkyCarpal.position(:,[1]);
newTree.Left_PinkyCarpal.ty= a.Left_PinkyCarpal.position(:,[2]);
newTree.Left_PinkyCarpal.tz= a.Left_PinkyCarpal.position(:,[3]);
newTree.Left_PinkyCarpal.r1x= a.Left_PinkyCarpal.velocity(:,[1]);
newTree.Left_PinkyCarpal.r1y= a.Left_PinkyCarpal.velocity(:,[2]);
newTree.Left_PinkyCarpal.r1z= a.Left_PinkyCarpal.velocity(:,[3]);
newTree.Left_PinkyCarpal.r2x= a.Left_PinkyCarpal.acceleration(:,[1]);
newTree.Left_PinkyCarpal.r2y= a.Left_PinkyCarpal.acceleration(:,[2]);
newTree.Left_PinkyCarpal.r2z= a.Left_PinkyCarpal.acceleration(:,[3]);
newTree.Left_PinkyCarpal.r3x= a.Left_PinkyCarpal.angularAcceleration(:,[1]);
newTree.Left_PinkyCarpal.r3y= a.Left_PinkyCarpal.angularAcceleration(:,[2]);
newTree.Left_PinkyCarpal.r3z= a.Left_PinkyCarpal.angularAcceleration(:,[3]);



newTree.Right_MiddleCarpal.tx= a.Right_MiddleCarpal.position(:,[1]);
newTree.Right_MiddleCarpal.ty= a.Right_MiddleCarpal.position(:,[2]);
newTree.Right_MiddleCarpal.tz= a.Right_MiddleCarpal.position(:,[3]);
newTree.Right_MiddleCarpal.r1x= a.Right_MiddleCarpal.velocity(:,[1]);
newTree.Right_MiddleCarpal.r1y= a.Right_MiddleCarpal.velocity(:,[2]);
newTree.Right_MiddleCarpal.r1z= a.Right_MiddleCarpal.velocity(:,[3]);
newTree.Right_MiddleCarpal.r2x= a.Right_MiddleCarpal.acceleration(:,[1]);
newTree.Right_MiddleCarpal.r2y= a.Right_MiddleCarpal.acceleration(:,[2]);
newTree.Right_MiddleCarpal.r2z= a.Right_MiddleCarpal.acceleration(:,[3]);
newTree.Right_MiddleCarpal.r3x= a.Right_MiddleCarpal.angularAcceleration(:,[1]);
newTree.Right_MiddleCarpal.r3y= a.Right_MiddleCarpal.angularAcceleration(:,[2]);
newTree.Right_MiddleCarpal.r3z= a.Right_MiddleCarpal.angularAcceleration(:,[3]);


newTree.Right_MiddleProximal.tx= a.Right_MiddleProximal.position(:,[1]);
newTree.Right_MiddleProximal.ty= a.Right_MiddleProximal.position(:,[2]);
newTree.Right_MiddleProximal.tz= a.Right_MiddleProximal.position(:,[3]);
newTree.Right_MiddleProximal.r1x= a.Right_MiddleProximal.velocity(:,[1]);
newTree.Right_MiddleProximal.r1y= a.Right_MiddleProximal.velocity(:,[2]);
newTree.Right_MiddleProximal.r1z= a.Right_MiddleProximal.velocity(:,[3]);
newTree.Right_MiddleProximal.r2x= a.Right_MiddleProximal.acceleration(:,[1]);
newTree.Right_MiddleProximal.r2y= a.Right_MiddleProximal.acceleration(:,[2]);
newTree.Right_MiddleProximal.r2z= a.Right_MiddleProximal.acceleration(:,[3]);
newTree.Right_MiddleProximal.r3x= a.Right_MiddleProximal.angularAcceleration(:,[1]);
newTree.Right_MiddleProximal.r3y= a.Right_MiddleProximal.angularAcceleration(:,[2]);
newTree.Right_MiddleProximal.r3z= a.Right_MiddleProximal.angularAcceleration(:,[3]);


newTree.Right_IndexCarpal.tx= a.Right_IndexCarpal.position(:,[1]);
newTree.Right_IndexCarpal.ty= a.Right_IndexCarpal.position(:,[2]);
newTree.Right_IndexCarpal.tz= a.Right_IndexCarpal.position(:,[3]);
newTree.Right_IndexCarpal.r1x= a.Right_IndexCarpal.velocity(:,[1]);
newTree.Right_IndexCarpal.r1y= a.Right_IndexCarpal.velocity(:,[2]);
newTree.Right_IndexCarpal.r1z= a.Right_IndexCarpal.velocity(:,[3]);
newTree.Right_IndexCarpal.r2x= a.Right_IndexCarpal.acceleration(:,[1]);
newTree.Right_IndexCarpal.r2y= a.Right_IndexCarpal.acceleration(:,[2]);
newTree.Right_IndexCarpal.r2z= a.Right_IndexCarpal.acceleration(:,[3]);
newTree.Right_IndexCarpal.r3x= a.Right_IndexCarpal.angularAcceleration(:,[1]);
newTree.Right_IndexCarpal.r3y= a.Right_IndexCarpal.angularAcceleration(:,[2]);
newTree.Right_IndexCarpal.r3z= a.Right_IndexCarpal.angularAcceleration(:,[3]);

newTree.Right_PinkyCarpal.tx= a.Right_PinkyCarpal.position(:,[1]);
newTree.Right_PinkyCarpal.ty= a.Right_PinkyCarpal.position(:,[2]);
newTree.Right_PinkyCarpal.tz= a.Right_PinkyCarpal.position(:,[3]);
newTree.Right_PinkyCarpal.r1x= a.Right_PinkyCarpal.velocity(:,[1]);
newTree.Right_PinkyCarpal.r1y= a.Right_PinkyCarpal.velocity(:,[2]);
newTree.Right_PinkyCarpal.r1z= a.Right_PinkyCarpal.velocity(:,[3]);
newTree.Right_PinkyCarpal.r2x= a.Right_PinkyCarpal.acceleration(:,[1]);
newTree.Right_PinkyCarpal.r2y= a.Right_PinkyCarpal.acceleration(:,[2]);
newTree.Right_PinkyCarpal.r2z= a.Right_PinkyCarpal.acceleration(:,[3]);
newTree.Right_PinkyCarpal.r3x= a.Right_PinkyCarpal.angularAcceleration(:,[1]);
newTree.Right_PinkyCarpal.r3y= a.Right_PinkyCarpal.angularAcceleration(:,[2]);
newTree.Right_PinkyCarpal.r3z= a.Right_PinkyCarpal.angularAcceleration(:,[3]);



%%  print json file 
%jsonencode( )
%fileText = jsonencode(newTree,'PrettyPrint',true);
fileText = jsonencode(newTree);
%fprintf(fid,"%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s \n%s ",fileText,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s72,s73,s74,s75,s76,s77,s78,s79,s80,s81,s82,s83,s84,s85,s86,s87,s88,s89,s90,s91,s92,s93,s94,s95,s96,s97,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47,t48,t49,t50,t51,t52,t53,t54,t55,t56,t57,t58,t59,t60,t61,t62,t63,t64,t65,t66,t67,t68,t69,t70,t71,t72,t73,t74,t75,t76,t77,t78,t79,t80,t81,t82,t83,t84,t85,t86,t87,t88,t89,t90,t91,t92,t93,t94,t95,t96,t97,t98,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32,k33,k34,k35,k36,k37,k38,k39,k40,k41,k42,k43,k44,k45,k46,k47,k48,k49,k50,k51,k52,k53,k54,k55,k56,k57,k58,k59,k60,k61,k62,k63,k64,k65,k66,k67,k68,k69,k70,k71,k72,k73,k74,k75,k76,k77,k78,k79,k80,k81,k82,k83,k84,k85,k86,k87,k88,k89,k90,k91,k92,k93,k94,k95,k96,k97,k98,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16,u17,u18,u19,u20,u21,u22,u23,u24,u25,u26,u27,u28,u29,u30,u31,u32,u33,u34,u35,u36,u37,u38,u39,u40,u41,u42,u43,u44,u45,u46,u47,u48,u49,u50,u51,u52,u53);
  
fid = fopen('EEP_Task_output.json','w');  
fprintf(fid,fileText);
fclose(fid);



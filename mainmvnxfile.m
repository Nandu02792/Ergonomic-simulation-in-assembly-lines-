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
%,"Atlanto-Axial",tree.segmentData([7]) not working

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

Translation = {struct("tx",a.Translation.position(:,[1]),"ty",a.Translation.position(:,[2]),"tz",a.Translation.position(:,[3]),"r1x" ,a.Translation.velocity(:,[1]),"r1y",a.Translation.position(:,[2]),"r1z",a.Translation.velocity(:,[3]),"r2x",a.Translation.acceleration(:,[1]),"r2y",a.Translation.acceleration(:,[2]),"r2z",a.Translation.acceleration(:,[3]))};
Rotation = {struct("tx",a.Rotation.position(:,[1]),"ty",a.Rotation.position(:,[2]),"tz",a.Rotation.position(:,[3]),"r1x" ,a.Rotation.velocity(:,[1]),"r1y",a.Rotation.position(:,[2]),"r1z",a.Rotation.velocity(:,[3]),"r2x",a.Rotation.acceleration(:,[1]),"r2y",a.Rotation.acceleration(:,[2]),"r2z",a.Rotation.acceleration(:,[3]))};
L5S1= {struct("tx",a.L5S1.position(:,[1]),"ty",a.L5S1.position(:,[2]),"tz",a.L5S1.position(:,[3]),"r1x" ,a.L5S1.velocity(:,[1]),"r1y",a.L5S1.velocity(:,[2]),"r1z",a.L5S1.velocity(:,[3]),"r2x",a.L5S1.acceleration(:,[1]),"r2y",a.L5S1.acceleration(:,[2]),"r2z",a.L5S1.acceleration(:,[3]))};
L3L4= {struct("tx",a.L3L4.position(:,[1]),"ty",a.L3L4.position(:,[2]),"tz",a.L3L4.position(:,[3]),"r1x" ,a.L3L4.velocity(:,[1]),"r1y",a.L3L4.velocity(:,[2]),"r1z",a.L3L4.velocity(:,[3]),"r2x",a.L3L4.acceleration(:,[1]),"r2y",a.L3L4.acceleration(:,[2]),"r2z",a.L3L4.acceleration(:,[3]))};
T12L1= {struct("tx",a.T12L1.position(:,[1]),"ty",a.T12L1.position(:,[2]),"tz",a.T12L1.position(:,[3]),"r1x" ,a.T12L1.velocity(:,[1]),"r1y",a.T12L1.velocity(:,[2]),"r1z",a.T12L1.velocity(:,[3]),"r2x",a.T12L1.acceleration(:,[1]),"r2y",a.T12L1.acceleration(:,[2]),"r2z",a.T12L1.acceleration(:,[3]))};
T6T7= {struct("tx",a.T6T7.position(:,[1]),"ty",a.T6T7.position(:,[2]),"tz",a.T6T7.position(:,[3]),"r1x" ,a.T6T7.velocity(:,[1]),"r1y",a.T6T7.velocity(:,[2]),"r1z",a.T6T7.velocity(:,[3]),"r2x",a.T6T7.acceleration(:,[1]),"r2y",a.T6T7.acceleration(:,[2]),"r2z",a.T6T7.acceleration(:,[3]))};
T1T2= {struct("tx",a.T1T2.position(:,[1]),"ty",a.T1T2.position(:,[2]),"tz",a.T1T2.position(:,[3]),"r1x" ,a.T1T2.velocity(:,[1]),"r1y",a.T1T2.velocity(:,[2]),"r1z",a.T1T2.velocity(:,[3]),"r2x",a.T1T2.acceleration(:,[1]),"r2y",a.T1T2.acceleration(:,[2]),"r2z",a.T1T2.acceleration(:,[3]))};
C6C7= {struct("tx",a.C6C7.position(:,[1]),"ty",a.C6C7.position(:,[2]),"tz",a.C6C7.position(:,[3]),"r1x" ,a.C6C7.velocity(:,[1]),"r1y",a.C6C7.velocity(:,[2]),"r1z",a.C6C7.velocity(:,[3]),"r2x",a.C6C7.acceleration(:,[1]),"r2y",a.C6C7.acceleration(:,[2]),"r2z",a.C6C7.acceleration(:,[3]))};
C4C5= {struct("tx",a.C4C5.position(:,[1]),"ty",a.C4C5.position(:,[2]),"tz",a.C4C5.position(:,[3]),"r1x" ,a.C4C5.velocity(:,[1]),"r1y",a.C4C5.velocity(:,[2]),"r1z",a.C4C5.velocity(:,[3]),"r2x",a.C4C5.acceleration(:,[1]),"r2y",a.C4C5.acceleration(:,[2]),"r2z",a.C4C5.acceleration(:,[3]))};
Eyeside= {struct("tx",a.Eyeside.position(:,[1]),"ty",a.Eyeside.position(:,[2]),"tz",a. Eyeside.position(:,[3]),"r1x" ,a. Eyeside.velocity(:,[1]),"r1y",a. Eyeside.velocity(:,[2]),"r1z",a. Eyeside.velocity(:,[3]),"r2x",a. Eyeside.acceleration(:,[1]),"r2y",a. Eyeside.acceleration(:,[2]),"r2z",a. Eyeside.acceleration(:,[3]))};
LeftKnee= {struct("tx",a.LeftKnee.position(:,[1]),"ty",a.LeftKnee.position(:,[2]),"tz",a. LeftKnee.position(:,[3]),"r1x" ,a. LeftKnee.velocity(:,[1]),"r1y",a. LeftKnee.velocity(:,[2]),"r1z",a. LeftKnee.velocity(:,[3]),"r2x",a. LeftKnee.acceleration(:,[1]),"r2y",a. LeftKnee.acceleration(:,[2]),"r2z",a. LeftKnee.acceleration(:,[3]))};
LeftAnkleRot= {struct("tx",a.LeftAnkleRot.position(:,[1]),"ty",a.LeftAnkleRot.position(:,[2]),"tz",a. LeftAnkleRot.position(:,[3]),"r1x" ,a. LeftAnkleRot.velocity(:,[1]),"r1y",a. LeftAnkleRot.velocity(:,[2]),"r1z",a. LeftAnkleRot.velocity(:,[3]),"r2x",a. LeftAnkleRot.acceleration(:,[1]),"r2y",a. LeftAnkleRot.acceleration(:,[2]),"r2z",a. LeftAnkleRot.acceleration(:,[3]))};
LeftAnkle= {struct("tx",a.LeftAnkle.position(:,[1]),"ty",a.LeftAnkle.position(:,[2]),"tz",a. LeftAnkle.position(:,[3]),"r1x" ,a. LeftAnkle.velocity(:,[1]),"r1y",a. LeftAnkle.velocity(:,[2]),"r1z",a. LeftAnkle.velocity(:,[3]),"r2x",a. LeftAnkle.acceleration(:,[1]),"r2y",a. LeftAnkle.acceleration(:,[2]),"r2z",a. LeftAnkle.acceleration(:,[3]))};
LeftToes= {struct("tx",a.LeftToes.position(:,[1]),"ty",a.LeftToes.position(:,[2]),"tz",a. LeftToes.position(:,[3]),"r1x" ,a. LeftToes.velocity(:,[1]),"r1y",a. LeftToes.velocity(:,[2]),"r1z",a. LeftToes.velocity(:,[3]),"r2x",a. LeftToes.acceleration(:,[1]),"r2y",a. LeftToes.acceleration(:,[2]),"r2z",a. LeftToes.acceleration(:,[3]))};
RightKnee= {struct("tx",a.RightKnee.position(:,[1]),"ty",a.RightKnee.position(:,[2]),"tz",a. RightKnee.position(:,[3]),"r1x" ,a. RightKnee.velocity(:,[1]),"r1y",a. RightKnee.velocity(:,[2]),"r1z",a. RightKnee.velocity(:,[3]),"r2x",a. RightKnee.acceleration(:,[1]),"r2y",a. RightKnee.acceleration(:,[2]),"r2z",a. RightKnee.acceleration(:,[3]))};
RightAnkleRot= {struct("tx",a.RightAnkleRot.position(:,[1]),"ty",a.RightAnkleRot.position(:,[2]),"tz",a. RightAnkleRot.position(:,[3]),"r1x" ,a. RightAnkleRot.velocity(:,[1]),"r1y",a. RightAnkleRot.velocity(:,[2]),"r1z",a. RightAnkleRot.velocity(:,[3]),"r2x",a. RightAnkleRot.acceleration(:,[1]),"r2y",a. RightAnkleRot.acceleration(:,[2]),"r2z",a. RightAnkleRot.acceleration(:,[3]))};
RightAnkle= {struct("tx",a.RightAnkle.position(:,[1]),"ty",a.RightAnkle.position(:,[2]),"tz",a. RightAnkle.position(:,[3]),"r1x" ,a. RightAnkle.velocity(:,[1]),"r1y",a. RightAnkle.velocity(:,[2]),"r1z",a. RightAnkle.velocity(:,[3]),"r2x",a. RightAnkle.acceleration(:,[1]),"r2y",a. RightAnkle.acceleration(:,[2]),"r2z",a. RightAnkle.acceleration(:,[3]))};
RightToes= {struct("tx",a.RightToes.position(:,[1]),"ty",a.RightToes.position(:,[2]),"tz",a. RightToes.position(:,[3]),"r1x" ,a. RightToes.velocity(:,[1]),"r1y",a. RightToes.velocity(:,[2]),"r1z",a. RightToes.velocity(:,[3]),"r2x",a. RightToes.acceleration(:,[1]),"r2y",a. RightToes.acceleration(:,[2]),"r2z",a. RightToes.acceleration(:,[3]))};
RightSC= {struct("tx",a.RightSC.position(:,[1]),"ty",a.RightSC.position(:,[2]),"tz",a. RightSC.position(:,[3]),"r1x" ,a. RightSC.velocity(:,[1]),"r1y",a. RightSC.velocity(:,[2]),"r1z",a. RightSC.velocity(:,[3]),"r2x",a. RightSC.acceleration(:,[1]),"r2y",a. RightSC.acceleration(:,[2]),"r2z",a. RightSC.acceleration(:,[3]))};
RightAC= {struct("tx",a.RightAC.position(:,[1]),"ty",a.RightAC.position(:,[2]),"tz",a. RightAC.position(:,[3]),"r1x" ,a. RightAC.velocity(:,[1]),"r1y",a. RightAC.velocity(:,[2]),"r1z",a. RightAC.velocity(:,[3]),"r2x",a. RightAC.acceleration(:,[1]),"r2y",a. RightAC.acceleration(:,[2]),"r2z",a. RightAC.acceleration(:,[3]))};
RightGH= {struct("tx",a.RightGH.position(:,[1]),"ty",a.RightGH.position(:,[2]),"tz",a. RightGH.position(:,[3]),"r1x" ,a. RightGH.velocity(:,[1]),"r1y",a. RightGH.velocity(:,[2]),"r1z",a. RightGH.velocity(:,[3]),"r2x",a. RightGH.acceleration(:,[1]),"r2y",a. RightGH.acceleration(:,[2]),"r2z",a. RightGH.acceleration(:,[3]))};
RightShoulderRotation= {struct("tx",a.RightShoulderRotation.position(:,[1]),"ty",a.RightShoulderRotation.position(:,[2]),"tz",a. RightShoulderRotation.position(:,[3]),"r1x" ,a. RightShoulderRotation.velocity(:,[1]),"r1y",a. RightShoulderRotation.velocity(:,[2]),"r1z",a. RightShoulderRotation.velocity(:,[3]),"r2x",a. RightShoulderRotation.acceleration(:,[1]),"r2y",a. RightShoulderRotation.acceleration(:,[2]),"r2z",a. RightShoulderRotation.acceleration(:,[3]))};
RightElbow= {struct("tx",a.RightElbow.position(:,[1]),"ty",a.RightElbow.position(:,[2]),"tz",a. RightElbow.position(:,[3]),"r1x" ,a. RightElbow.velocity(:,[1]),"r1y",a. RightElbow.velocity(:,[2]),"r1z",a. RightElbow.velocity(:,[3]),"r2x",a. RightElbow.acceleration(:,[1]),"r2y",a. RightElbow.acceleration(:,[2]),"r2z",a. RightElbow.acceleration(:,[3]))};
RightWristRotation= {struct("tx",a.RightWristRotation.position(:,[1]),"ty",a.RightWristRotation.position(:,[2]),"tz",a. RightWristRotation.position(:,[3]),"r1x" ,a. RightWristRotation.velocity(:,[1]),"r1y",a. RightWristRotation.velocity(:,[2]),"r1z",a. RightWristRotation.velocity(:,[3]),"r2x",a. RightWristRotation.acceleration(:,[1]),"r2y",a. RightWristRotation.acceleration(:,[2]),"r2z",a. RightWristRotation.acceleration(:,[3]))};
LeftSC= {struct("tx",a.LeftSC.position(:,[1]),"ty",a.LeftSC.position(:,[2]),"tz",a. LeftSC.position(:,[3]),"r1x" ,a. LeftSC.velocity(:,[1]),"r1y",a. LeftSC.velocity(:,[2]),"r1z",a. LeftSC.velocity(:,[3]),"r2x",a. LeftSC.acceleration(:,[1]),"r2y",a. LeftSC.acceleration(:,[2]),"r2z",a. LeftSC.acceleration(:,[3]))};
LeftAC= {struct("tx",a.LeftAC.position(:,[1]),"ty",a.LeftAC.position(:,[2]),"tz",a. LeftAC.position(:,[3]),"r1x" ,a. LeftAC.velocity(:,[1]),"r1y",a. LeftAC.velocity(:,[2]),"r1z",a. LeftAC.velocity(:,[3]),"r2x",a. LeftAC.acceleration(:,[1]),"r2y",a. LeftAC.acceleration(:,[2]),"r2z",a. LeftAC.acceleration(:,[3]))};

LeftGH= {struct("tx",a.LeftGH.position(:,[1]),"ty",a.LeftGH.position(:,[2]),"tz",a. LeftGH.position(:,[3]),"r1x" ,a. LeftGH.velocity(:,[1]),"r1y",a. LeftGH.velocity(:,[2]),"r1z",a. LeftGH.velocity(:,[3]),"r2x",a. LeftGH.acceleration(:,[1]),"r2y",a. LeftGH.acceleration(:,[2]),"r2z",a. LeftGH.acceleration(:,[3]))};
LeftShoulderRotation= {struct("tx",a.LeftShoulderRotation.position(:,[1]),"ty",a.LeftShoulderRotation.position(:,[2]),"tz",a. LeftShoulderRotation.position(:,[3]),"r1x" ,a. LeftShoulderRotation.velocity(:,[1]),"r1y",a. LeftShoulderRotation.velocity(:,[2]),"r1z",a. LeftShoulderRotation.velocity(:,[3]),"r2x",a. LeftShoulderRotation.acceleration(:,[1]),"r2y",a. LeftShoulderRotation.acceleration(:,[2]),"r2z",a. LeftShoulderRotation.acceleration(:,[3]))};
LeftElbow= {struct("tx",a.LeftElbow.position(:,[1]),"ty",a.LeftElbow.position(:,[2]),"tz",a. LeftElbow.position(:,[3]),"r1x" ,a. LeftElbow.velocity(:,[1]),"r1y",a. LeftElbow.velocity(:,[2]),"r1z",a. LeftElbow.velocity(:,[3]),"r2x",a. LeftElbow.acceleration(:,[1]),"r2y",a. LeftElbow.acceleration(:,[2]),"r2z",a. LeftElbow.acceleration(:,[3]))};
LeftWristRotation= {struct("tx",a.LeftWristRotation.position(:,[1]),"ty",a.LeftWristRotation.position(:,[2]),"tz",a. LeftWristRotation.position(:,[3]),"r1x" ,a. LeftWristRotation.velocity(:,[1]),"r1y",a. LeftWristRotation.velocity(:,[2]),"r1z",a. LeftWristRotation.velocity(:,[3]),"r2x",a. LeftWristRotation.acceleration(:,[1]),"r2y",a. LeftWristRotation.acceleration(:,[2]),"r2z",a. LeftWristRotation.acceleration(:,[3]))};
LeftWrist= {struct("tx",a.LeftWrist.position(:,[1]),"ty",a.LeftWrist.position(:,[2]),"tz",a. LeftWrist.position(:,[3]),"r1x" ,a. LeftWrist.velocity(:,[1]),"r1y",a. LeftWrist.velocity(:,[2]),"r1z",a. LeftWrist.velocity(:,[3]),"r2x",a. LeftWrist.acceleration(:,[1]),"r2y",a. LeftWrist.acceleration(:,[2]),"r2z",a. LeftWrist.acceleration(:,[3]))};
Left_MiddleCarpal= {struct("tx",a.Left_MiddleCarpal.position(:,[1]),"ty",a.Left_MiddleCarpal.position(:,[2]),"tz",a. Left_MiddleCarpal.position(:,[3]),"r1x" ,a. Left_MiddleCarpal.velocity(:,[1]),"r1y",a. Left_MiddleCarpal.velocity(:,[2]),"r1z",a. Left_MiddleCarpal.velocity(:,[3]),"r2x",a. Left_MiddleCarpal.acceleration(:,[1]),"r2y",a. Left_MiddleCarpal.acceleration(:,[2]),"r2z",a. Left_MiddleCarpal.acceleration(:,[3]))};
Left_MiddleProximal= {struct("tx",a.Left_MiddleProximal.position(:,[1]),"ty",a.Left_MiddleProximal.position(:,[2]),"tz",a. Left_MiddleProximal.position(:,[3]),"r1x" ,a. Left_MiddleProximal.velocity(:,[1]),"r1y",a. Left_MiddleProximal.velocity(:,[2]),"r1z",a. Left_MiddleProximal.velocity(:,[3]),"r2x",a. Left_MiddleProximal.acceleration(:,[1]),"r2y",a. Left_MiddleProximal.acceleration(:,[2]),"r2z",a. Left_MiddleProximal.acceleration(:,[3]))};
Left_IndexCarpal= {struct("tx",a.Left_IndexCarpal.position(:,[1]),"ty",a.Left_IndexCarpal.position(:,[2]),"tz",a. Left_IndexCarpal.position(:,[3]),"r1x" ,a. Left_IndexCarpal.velocity(:,[1]),"r1y",a. Left_IndexCarpal.velocity(:,[2]),"r1z",a. Left_IndexCarpal.velocity(:,[3]),"r2x",a. Left_IndexCarpal.acceleration(:,[1]),"r2y",a. Left_IndexCarpal.acceleration(:,[2]),"r2z",a. Left_IndexCarpal.acceleration(:,[3]))};
Left_PinkyCarpal= {struct("tx",a.Left_PinkyCarpal.position(:,[1]),"ty",a.Left_PinkyCarpal.position(:,[2]),"tz",a. Left_PinkyCarpal.position(:,[3]),"r1x" ,a. Left_PinkyCarpal.velocity(:,[1]),"r1y",a. Left_PinkyCarpal.velocity(:,[2]),"r1z",a. Left_PinkyCarpal.velocity(:,[3]),"r2x",a. Left_PinkyCarpal.acceleration(:,[1]),"r2y",a. Left_PinkyCarpal.acceleration(:,[2]),"r2z",a. Left_PinkyCarpal.acceleration(:,[3]))};
Right_MiddleCarpal= {struct("tx",a.Right_MiddleCarpal.position(:,[1]),"ty",a.Right_MiddleCarpal.position(:,[2]),"tz",a. Right_MiddleCarpal.position(:,[3]),"r1x" ,a. Right_MiddleCarpal.velocity(:,[1]),"r1y",a. Right_MiddleCarpal.velocity(:,[2]),"r1z",a. Right_MiddleCarpal.velocity(:,[3]),"r2x",a. Right_MiddleCarpal.acceleration(:,[1]),"r2y",a. Right_MiddleCarpal.acceleration(:,[2]),"r2z",a. Right_MiddleCarpal.acceleration(:,[3]))};
Right_MiddleProximal= {struct("tx",a.Right_MiddleProximal.position(:,[1]),"ty",a.Right_MiddleProximal.position(:,[2]),"tz",a. Right_MiddleProximal.position(:,[3]),"r1x" ,a. Right_MiddleProximal.velocity(:,[1]),"r1y",a. Right_MiddleProximal.velocity(:,[2]),"r1z",a. Right_MiddleProximal.velocity(:,[3]),"r2x",a. Right_MiddleProximal.acceleration(:,[1]),"r2y",a. Right_MiddleProximal.acceleration(:,[2]),"r2z",a. Right_MiddleProximal.acceleration(:,[3]))};
Right_IndexCarpal= {struct("tx",a.Right_IndexCarpal.position(:,[1]),"ty",a.Right_IndexCarpal.position(:,[2]),"tz",a. Right_IndexCarpal.position(:,[3]),"r1x" ,a. Right_IndexCarpal.velocity(:,[1]),"r1y",a. Right_IndexCarpal.velocity(:,[2]),"r1z",a. Right_IndexCarpal.velocity(:,[3]),"r2x",a. Right_IndexCarpal.acceleration(:,[1]),"r2y",a. Right_IndexCarpal.acceleration(:,[2]),"r2z",a. Right_IndexCarpal.acceleration(:,[3]))};
Right_PinkyCarpal= {struct("tx",a.Right_PinkyCarpal.position(:,[1]),"ty",a.Right_PinkyCarpal.position(:,[2]),"tz",a. Right_PinkyCarpal.position(:,[3]),"r1x" ,a. Right_PinkyCarpal.velocity(:,[1]),"r1y",a. Right_PinkyCarpal.velocity(:,[2]),"r1z",a. Right_PinkyCarpal.velocity(:,[3]),"r2x",a. Right_PinkyCarpal.acceleration(:,[1]),"r2y",a. Right_PinkyCarpal.acceleration(:,[2]),"r2z",a. Right_PinkyCarpal.acceleration(:,[3]))};

%%  print json file 
%jsonencode( )
jsonencode(a);
jsonencode(Translation);
jsonencode(Rotation)
jsonencode(L5S1)
jsonencode(L3L4)
jsonencode(T12L1)
jsonencode(T6T7)
jsonencode(T1T2)
jsonencode(C6C7)
jsonencode(C4C5)
jsonencode(Eyeside)
jsonencode(LeftKnee)
jsonencode(LeftAnkleRot)
jsonencode(LeftAnkle)
jsonencode(LeftToes)
jsonencode(RightKnee)
jsonencode(RightAnkleRot)
jsonencode(RightAnkle)
jsonencode(RightToes)
jsonencode(RightSC)
jsonencode(RightAC)
jsonencode(RightGH)
jsonencode(RightShoulderRotation)
jsonencode(RightElbow)
jsonencode(RightWristRotation)
jsonencode(LeftSC)
jsonencode(LeftAC)
jsonencode(LeftGH)
jsonencode(LeftShoulderRotation)
jsonencode(LeftElbow)
jsonencode(LeftWristRotation)
jsonencode(LeftWrist)
jsonencode(Left_MiddleCarpal)
jsonencode(Left_MiddleProximal)
jsonencode(Left_IndexCarpal)
jsonencode(Left_PinkyCarpal)
jsonencode(Right_MiddleCarpal)
jsonencode(Right_MiddleProximal)
jsonencode(Right_IndexCarpal)
jsonencode(Right_PinkyCarpal)

%%print 

% outputFile = fopen('ouputData.json','w');
% fprintf(outputFile,'%s',jsonencode(a));
% fcolse(ouputfFile);

% jsave('myData.json',a);

%saveJSONFile(a,'outputFile')



%% if (isfield(tree.metaData, 'comment'))
%     fileComments = tree.metaData.comment; % comments written when saving the file
% end


%% Read some basic properties of the subject;
% frameRate = tree.metaData.subject_frameRate;
% suitLabel = tree.metaData.subject_label;
% originalFilename = tree.metaData.subject_originalFilename;
% recDate = tree.metaData.subject_recDate;
% segmentCount = tree.metaData.subject_segmentCount;
% %% Retrieve sensor labels
% %creates a struct with sensor data
% if isfield(tree,'sensorData') && isstruct(tree.sensorData)
%     sensorData = tree.sensorData;
% end
%% 
% %% Retrieve segment labels
% %creates a struct with segment definitions
% if isfield(tree,'segmentData') && isstruct(tree.segmentData)
%     segmentData = tree.segmentData;
% end
%% 
% %% Read the data from the structure e.g. segment 1
% if isfield(tree.segmentData,'position')
%     % Plot position of segment 1
%     figure('name','Position of first segment')
%     plot(tree.segmentData(1).position)
%     xlabel('frames')
%     ylabel('Position in the global frame')
%     legend('x','y','z')
%     title ('Position of first segment')
%%     
%     % Plot 3D displacement of segment 1
%     figure('name','Position of first segment in 3D')
%     plot3(tree.segmentData(1).position(:,1),tree.segmentData(1).position(:,2),tree.segmentData(1).position(:,3));
%     xlabel('x')
%     ylabel('y')
%     zlabel('z')
%     title ('Displacement of first segment in space')
% end

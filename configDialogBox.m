 
 classdef configDialogBox
    methods(Static)    
        function selectmodel(x,x1)
           % x='VehStatus_In__ADAS_1_0_0_rev015Q_L21B.slx';
load_system(x);
model_name=strrep(x,'.slx','');
 model=1;
configDialogBox.config(model,model_name)
%  x1='b_model.slx';
load_system(x1);
model_name=strrep(x1,'.slx','');
 model=2;
configDialogBox.config(model,model_name)
        end
        function config(num,model_name)
           % load_system('VehStatus_In__ADAS_1_0_0_rev019N_L21B.slx');
 clc
  mkdir screenshotpics
%  cs = getActiveConfigSet('VehStatus_In__ADAS_1_0_0_rev019N_L21B'); 
% cs = getActiveConfigSet(strrep(x,'.slx',''));
 hCs = getActiveConfigSet(gcs);
 Solver = getComponent(hCs, 'Solver');
 Data_Import_Export = getComponent(hCs, 'Data Import/Export');
 Optimization = getComponent(hCs, 'Optimization');
 Diagnostics = getComponent(hCs, 'Diagnostics');
 Hardware_Implementation = getComponent(hCs, 'Hardware Implementation');
 Model_Referencing = getComponent(hCs, 'Model Referencing');
 Simulation_Target = getComponent(hCs, 'Simulation Target');
 Code_Generation = getComponent(hCs, 'Code Generation');
 Parameters={'Solver',3,1, 
'Data_Import_Export', 4,2, 
'Optimization_General',5,3,
'Optimization_Signals_Parameters',5,3, 
'Optimization_Stateflow',5,3,
'Diagnostics_Solver',6,4,
'Diagnostics_Sample_Time',6,4, 
'Diagnostics_Data_Validity',6,4, 
'Diagnostics_Type_Conversion',6,4, 
'Diagnostics_Connectivity',6,4,
'Diagnostics_Compatibility',6,4,
'Diagnostics_Model_Referencing',6,4,
'Diagnostics_Saving',6,4,
'Diagnostics_Stateflow',6,4, 
'Hardware_Implementation',7,5, 
'Model_Referencing',8,6,
'Simulation_Target_General',9,7, 
'Simulation_Target_Symbols',9,7, 
'Simulation_Target_Custom_Code',9,7};
if license('test','RTW_Embedded_Coder')
siz=size(Parameters);
l=siz(1)+1;
n=1;
fid=fopen([model_name '.m']);
while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break
    end
    if strfind(tline, 'Code Generation')        
        newChr = strrep(tline,'% ','');
        newChr = strrep(newChr,' pane','');
           newChr = strrep(newChr,' ','_');
           newChr = strrep(newChr,':','_');
            arr{n}=newChr;
            n=n+1;
    end
end
    n=1;
    len=length(arr);
    if len<11
        len=len+1;
    else
        len=len+2;
    end
    for i=1:len
        if i==2
    Parameters{l,1}='Code_Generation_Report';
            Parameters{l,2}=10;
            Parameters{l,3}=8;
            l=l+1;
        elseif i==12
            Parameters{l,1}='Code_Generation_Data_Type_Replacement';
            Parameters{l,2}=10;
            Parameters{l,3}=8;
            l=l+1;
        else        
            Parameters{l,1}=arr{n};
            Parameters{l,2}=10;
            Parameters{l,3}=8;
            l=l+1;
            n=n+1;
        end
    end
end
siz=size(Parameters);
siz=siz(1);
cnt=7;
 panes={'Solver','Data_Import_Export','Optimization','Diagnostics','Hardware_Implementation','Model_Referencing','Simulation_Target'}; 
 robot = java.awt.Robot;
 if license('test','RTW_Embedded_Coder')
   panes{8}='Code_Generation';   
 cnt=8;
 end
 for i=1:cnt
     open(sprintf('%s',panes{i}))
      pause(.5)
   if i==3
      for j=1:2
      robot.keyPress    (java.awt.event.KeyEvent.VK_LEFT);
      robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);
      end
      m=1;
          for k=1:19
             if Parameters{k,3}==i
             val{m}=Parameters{k,1};
             m=m+1;
             end
          end
      for j=1:3    
         
       configDialogBox.screenshot(val{j})
           if j==3
              robot.keyPress    (java.awt.event.KeyEvent.VK_ESCAPE );
              robot.keyRelease  (java.awt.event.KeyEvent.VK_ESCAPE ); 
          else
              robot.keyPress    (java.awt.event.KeyEvent.VK_RIGHT);
              robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
           end
      end           
   
   elseif i==4
      for j=1:8
      robot.keyPress    (java.awt.event.KeyEvent.VK_LEFT);
      robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);
      end
     %write code 
     m=1;
          for k=1:19
             if Parameters{k,3}==i
             val{m}=Parameters{k,1};
             m=m+1;
             end
          end
      for j=1:9   
          
            configDialogBox.screenshot(val{j})
         if j==9
              robot.keyPress    (java.awt.event.KeyEvent.VK_ESCAPE );
              robot.keyRelease  (java.awt.event.KeyEvent.VK_ESCAPE ); 
         else
              robot.keyPress    (java.awt.event.KeyEvent.VK_RIGHT);
              robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
         end
      end           
       
   elseif i==7
       for j=1:2
       robot.keyPress    (java.awt.event.KeyEvent.VK_LEFT);
       robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);
       end 
       %write code
       m=1;
          for k=1:19
             if Parameters{k,3}==i
             val{m}=Parameters{k,1};
             m=m+1;
             end
          end
       for j=1:3     
         
            configDialogBox.screenshot(val{j})
         if j==3
              robot.keyPress    (java.awt.event.KeyEvent.VK_ESCAPE );
              robot.keyRelease  (java.awt.event.KeyEvent.VK_ESCAPE ); 
         else
              robot.keyPress    (java.awt.event.KeyEvent.VK_RIGHT);
              robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
         end
       end 
       
         elseif i==8 && license('test','RTW_Embedded_Coder')
      for j=1:len
      robot.keyPress    (java.awt.event.KeyEvent.VK_LEFT);
      robot.keyRelease  (java.awt.event.KeyEvent.VK_LEFT);
      end
     %write code 
     m=1;
          for k=1:length(Parameters)
             if Parameters{k,3}==i
             val{m}=Parameters{k,1};
             m=m+1;
             end
          end
          
      for j=1:len
          
            configDialogBox.screenshot(val{j})
         if j==len
              robot.keyPress    (java.awt.event.KeyEvent.VK_ESCAPE );
              robot.keyRelease  (java.awt.event.KeyEvent.VK_ESCAPE ); 
         else
              robot.keyPress    (java.awt.event.KeyEvent.VK_RIGHT);
              robot.keyRelease  (java.awt.event.KeyEvent.VK_RIGHT);
         end
      end
       
       
   else
         configDialogBox.screenshot(panes{i})
         robot.keyPress    (java.awt.event.KeyEvent.VK_ESCAPE );
         robot.keyRelease  (java.awt.event.KeyEvent.VK_ESCAPE ); 
   end
 end
filename=[pwd '\Configuration_Parameters_Comparison.xlsx'];
Excel = actxserver('Excel.Application'); 
Workbooks = Excel.Workbooks; 
Workbook=Workbooks.Open(filename);    
Workbook.Activate
Sheets = Excel.ActiveWorkBook.Sheets; 
images =[pwd '\screenshotpics\'];
pngfiles=dir(fullfile(images,'*.png*'));
n=numel(pngfiles); 
len1=Sheets.Count;
if len1<10
for i=1:8
     Sheets.Add([], Sheets.Item(Sheets.Count))
end
end
for i=1:length(Parameters)
%     Sheets.Add([], Sheets.Item(Sheets.Count))
   for j=1:n
       picname=regexprep(pngfiles(j).name,'.png','');
       if strcmp(Parameters{i,1},picname)
           no=Parameters{i,2};         
       sheet = get(Sheets, 'Item',no);
sheet.Activate;
if num==1
if i==1 || (i>1 && Parameters{i-1,2}~=Parameters{i,2})
    cnt=1;
    range='B1';  
else
   cnt=cnt+1;
     range= strcat('B', num2str((40*cnt)-40));   
end
else
if i==1 || (i>1 && Parameters{i-1,2}~=Parameters{i,2})
    cnt=1;
    range='M1';  
else
   cnt=cnt+1;
     range= strcat('M', num2str((40*cnt)-40));   
end
end
left = sheet.Range(range).Left;
top = sheet.Range(range).Top;
m=pwd;
st=[images pngfiles(j).name];
sheet.Shapes.AddPicture(st,0,1,left,top,-1,-1);
       end   
   end   
end
Workbook.Save;
Excel.Quit;
        end
        function screenshot(name)
          h2AllOpenDlgs = DAStudio.ToolRoot.getOpenDialogs;
strDlgTitle    = h2AllOpenDlgs(1).getTitle;
iPos = h2AllOpenDlgs(1).position;
h2AllOpenDlgs(1).position = [iPos(1)  iPos(2)   iPos(3)   iPos(4)*1.2];
iPos = h2AllOpenDlgs(1).position;
robot = java.awt.Robot;
rect = java.awt.Rectangle(iPos(1),iPos(2),iPos(3),iPos(4));
cap = robot.createScreenCapture(rect);
% Convert to an RGB image
rgb = typecast(cap.getRGB(0,0,cap.getWidth,cap.getHeight,[],0,cap.getWidth),'uint8');
imgData = zeros(cap.getHeight,cap.getWidth,3,'uint8');
imgData(:,:,1) = reshape(rgb(3:4:end),cap.getWidth,[])';
imgData(:,:,2) = reshape(rgb(2:4:end),cap.getWidth,[])';
imgData(:,:,3) = reshape(rgb(1:4:end),cap.getWidth,[])';
% Show or save to file
folder=[pwd '\screenshotpics\'];
fullFileName = fullfile(folder, [name '.png']);
imwrite(imgData, fullFileName);
% imwrite(imgData,[name '.png'])
        end
        function CreateLinkonValues(Difference_in,num)
             hCs = getActiveConfigSet(gcs);
 Solver = getComponent(hCs, 'Solver');
 SolverFieldnames=fieldnames(Solver);
 Data_Import_Export = getComponent(hCs, 'Data Import/Export');
 Data_Import_ExportFieldnames=fieldnames(Data_Import_Export);
 Optimization = getComponent(hCs, 'Optimization');
 OptimizationFieldnames=fieldnames(Optimization);
 Diagnostics = getComponent(hCs, 'Diagnostics');
 DiagnosticsFieldnames=fieldnames(Diagnostics);
 Hardware_Implementation = getComponent(hCs, 'Hardware Implementation');
 Hardware_ImplementationFieldnames=fieldnames(Hardware_Implementation);
 Model_Referencing = getComponent(hCs, 'Model Referencing');
 Model_ReferencingFieldnames=fieldnames(Model_Referencing);
 Simulation_Target = getComponent(hCs, 'Simulation Target');
 Simulation_TargetFieldnames=fieldnames(Simulation_Target);
 Code_Generation = getComponent(hCs, 'Code Generation');
Code_GenerationFieldnames=fieldnames(Code_Generation);
filename=[pwd '\Configuration_Parameters_Comparison.xlsx'];
exl = actxserver('excel.application');
exlWkbk = exl.Workbooks;
exlFile = exlWkbk.Open(filename);
exlFile.Worksheets.Item(1).Name = 'Difference_in_Values';
exlFile.Worksheets.Item(2).Name = 'Additional_Parameters';
exlFile.Worksheets.Item(3).Name = 'Solver';
exlFile.Worksheets.Item(4).Name = 'Data_Import_Export';
exlFile.Worksheets.Item(5).Name = 'Optimization';
exlFile.Worksheets.Item(6).Name = 'Diagnostics';
exlFile.Worksheets.Item(7).Name = 'Hardware_Implementation';
exlFile.Worksheets.Item(8).Name = 'Model_Referencing';
exlFile.Worksheets.Item(9).Name = 'Simulation_Target';
exlFile.Worksheets.Item(10).Name = 'Code_Generation';
if num==3
    n=4;
    col='F';
    sheet='Additional_Parameters';
elseif num==2
    n=1;
    col='C';
    sheet='Additional_Parameters';
else
    n=1;
    col='D';
    sheet='Difference_in_Values';
end
siz=size(Difference_in);
len=length(Difference_in);
if len==3
    len=len-1;
end
if siz(1)>=2
for i=2:len
    if ismember(num2str(Difference_in{i,n}),SolverFieldnames)
        exlSheet1 = exlFile.Sheets.Item(sprintf('%s',sheet));
        j=i+1;
rngObj = exlSheet1.Range(sprintf('%c%d',col,j)); %we will add the link to this cell
Anchor=rngObj;
Address='';
exlSheet1 = exlFile.Sheets.Item('Solver');
SubAddress=strcat('Solver','!A1');
DisplayText='Solver';
Description='Solver';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);

    elseif ismember(num2str(Difference_in{i,n}),Data_Import_ExportFieldnames)
        exlSheet1 = exlFile.Sheets.Item(sprintf('%s',sheet));
        j=i+1;
rngObj = exlSheet1.Range(sprintf('%c%d',col,j)); %we will add the link to this cell
Anchor=rngObj;
Address='';
exlSheet1 = exlFile.Sheets.Item('Data_Import_Export');
SubAddress=strcat('Data_Import_Export','!A1');
DisplayText='Data_Import_Export';
Description='Data_Import_Export';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText); 
    elseif ismember(num2str(Difference_in{i,n}),OptimizationFieldnames)
        exlSheet1 = exlFile.Sheets.Item(sprintf('%s',sheet));
        j=i+1;
rngObj = exlSheet1.Range(sprintf('%c%d',col,j)); %we will add the link to this cell
Anchor=rngObj;
Address='';
exlSheet1 = exlFile.Sheets.Item('Optimization');
SubAddress=strcat('Optimization','!A1');
DisplayText='Optimization';
Description='Optimization';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);      
    elseif ismember(num2str(Difference_in{i,n}),DiagnosticsFieldnames)
        exlSheet1 = exlFile.Sheets.Item(sprintf('%s',sheet));
        j=i+1;
rngObj = exlSheet1.Range(sprintf('%c%d',col,j)); %we will add the link to this cell
Anchor=rngObj;
Address='';
exlSheet1 = exlFile.Sheets.Item('Diagnostics');
SubAddress=strcat('Diagnostics','!A1');
DisplayText='Diagnostics';
Description='Diagnostics';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);   
     
    elseif ismember(num2str(Difference_in{i,n}),Hardware_ImplementationFieldnames)
        exlSheet1 = exlFile.Sheets.Item(sprintf('%s',sheet));
        j=i+1;
rngObj = exlSheet1.Range(sprintf('%c%d',col,j)); %we will add the link to this cell
Anchor=rngObj;
Address='';
exlSheet1 = exlFile.Sheets.Item('Hardware_Implementation');
SubAddress=strcat('Hardware_Implementation','!A1');
DisplayText='Hardware_Implementation';
Description='Hardware_Implementation';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);   

    elseif ismember(num2str(Difference_in{i,n}),Model_ReferencingFieldnames)
        exlSheet1 = exlFile.Sheets.Item(sprintf('%s',sheet));
        j=i+1;
rngObj = exlSheet1.Range(sprintf('%c%d',col,j)); %we will add the link to this cell
Anchor=rngObj;
Address='';
exlSheet1 = exlFile.Sheets.Item('Model_Referencing');
SubAddress=strcat('Model_Referencing','!A1');
DisplayText='Model_Referencing';
Description='Model_Referencing';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);

    elseif ismember(num2str(Difference_in{i,n}),Simulation_TargetFieldnames)
        exlSheet1 = exlFile.Sheets.Item(sprintf('%s',sheet));
        j=i+1;
rngObj = exlSheet1.Range(sprintf('%c%d',col,j)); %we will add the link to this cell
Anchor=rngObj;
Address='';
exlSheet1 = exlFile.Sheets.Item('Simulation_Target');
SubAddress=strcat('Simulation_Target','!A1');
DisplayText='Simulation_Target';
Description='Simulation_Target';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);
%  elseif ismember(num2str(Difference_in{i,n}),Code_GenerationFieldnames)
%         exlSheet1 = exlFile.Sheets.Item(sprintf('%s',sheet));
%         j=i+1;
% rngObj = exlSheet1.Range(sprintf('%c%d',col,j)); %we will add the link to this cell
% Anchor=rngObj;
% Address='';
% exlSheet1 = exlFile.Sheets.Item('Code_Generation');
% SubAddress=strcat('Code_Generation','!A1');
% DisplayText='Code_Generation';
% Description='Code_Generation';
% exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText); 
    end     
end
end
if license('test','RTW_Embedded_Coder')
siz=size(Difference_in);
siz=siz(1);
for i=3:siz+1
%     exlSheet1 = exlFile.Sheets.Item(sprintf('%s',sheet));
    myValue = exlFile.Sheets.Item('Difference_in_Values').Range(sprintf('A%d',i)).Value;
    if isnan(myValue)
        break;
    else
          mValue = exlFile.Sheets.Item('Difference_in_Values').Range(sprintf('D%d',i)).Value;
        if isnan(mValue)
rngObj =exlFile.Sheets.Item('Difference_in_Values').Range(sprintf('D%d',i)); %we will add the link to this cell
Anchor=rngObj;
Address='';
exlSheet1 = exlFile.Sheets.Item('Code_Generation');
SubAddress=strcat('Code_Generation','!A1');
DisplayText='Code_Generation';
Description='Code_Generation';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);
        end
    end
end
end
shts={'Solver','Data_Import_Export','Optimization','Diagnostics','Hardware_Implementation','Model_Referencing','Simulation_Target','Code_Generation'};

for i=1:length(shts)

exlSheet1 = exlFile.Sheets.Item(sprintf('%s',shts{i}));
rngObj = exlSheet1.Range('A1'); %we will add the link to this cell
Anchor=rngObj;
Address='';
exlSheet1 = exlFile.Sheets.Item('Difference_in_Values');
SubAddress=strcat(sprintf('%s',sheet),'!A1');
DisplayText='Back';
Description='Back';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);
end
exlFile.Save();
exlFile.Close();
exl.Quit;
exl.delete;

        end    
        
        
        function block_paramter_difference_highlighting(A_Missing,A_Missing_c,A_Diff,A_Diff_c,links,model_name_1,model_name_2)
          clc         
          
          a=size(A_Missing);
           mkdir linkpicsBlockDiff
  delete('linkpicsBlockDiff\*')
          load_system(model_name_1); 
          load_system(model_name_2); 
%            for i=1:2:a(2)       
%         for j=2:a(1)
%         if ~isempty(A_Missing{j,i})
%               set_param(sprintf('%s',A_Missing{j,i}),'BackgroundColor','white');
%         end
%         end
%            end
%            a=size(A_Missing_c);
%               for i=1:2:a(2)       
%         for j=2:a(1)
%         if ~isempty(A_Missing_c{j,i})
%               set_param(sprintf('%s',A_Missing_c{j,i}),'BackgroundColor','white');
%         end
%         end
%              end
             a=size(A_Diff);
            load_system(model_name_1);           
          for i=1:2:a(2)   
        for j=2:a(1)
   c= strsplit(char(A_Diff{j,i}),'property_name');
   A_Diff{j,i}=c(1);
   A_Diff{j,i}=regexprep(char(A_Diff{j,i}),'[/]$',''); 
        if ~isempty(A_Diff{j,i})
              set_param(char(A_Diff{j,i}),'BackgroundColor','cyan');       
              
%               'cyan', 'magenta', 'yellow', 'gray', 'lightBlue',
        end
        end
          end
         
           a=size(A_Diff_c);
            load_system(model_name_2);           
          for i=1:2:a(2)   
        for j=2:a(1)
   c= strsplit(char(A_Diff_c{j,i}),'property_name');
   A_Diff_c{j,i}=c(1);
   A_Diff_c{j,i}=regexprep(char(A_Diff_c{j,i}),'[/]$',''); 
        if ~isempty(A_Diff_c{j,i})
              set_param(char(A_Diff_c{j,i}),'BackgroundColor','cyan');            
        end
        end
          end
           
          
        load_system(model_name_2);
       load_system(model_name_1); 
        for i=1:length(links)
            strf=strrep(links{i},model_name_1,model_name_2);
            
                if i==1
              open_system(model_name_2)
              open_system(model_name_2)
         print -djpeg -s bb_model.jpeg
         newfile1=sprintf('%s.jpeg',model_name_2);
oldfile1='bb_model.jpeg';
movefile(oldfile1,newfile1)
movefile(sprintf('%s',newfile1), 'linkpicsBlockDiff')
            open_system(model_name_1)
            open_system(model_name_1)
            print -djpeg -s aa_model.jpeg
            newfile=sprintf('%s.jpeg',model_name_1);
oldfile='aa_model.jpeg';
movefile(oldfile,newfile)
movefile(sprintf('%s',newfile), 'linkpicsBlockDiff')
                end
               
           sys=model_name_2;
SubSystemBlocks = find_system(sys,'LookUnderMasks','all','BlockType','SubSystem');
            if ismember(strf,SubSystemBlocks) 
           open_system(strf)
         print -djpeg -s bb_model.jpeg
            open_system(links{i})
            print -djpeg -s aa_model.jpeg
            
 str1=regexprep(strf, '/', '_');
newfile1=sprintf('%s.jpeg',str1);
oldfile1='bb_model.jpeg';
movefile(oldfile1,newfile1)
movefile(sprintf('%s',newfile1), 'linkpicsBlockDiff')
  
str=regexprep(links{i}, '/', '_');
newfile=sprintf('%s.jpeg',str);
oldfile='aa_model.jpeg';
movefile(oldfile,newfile)
movefile(sprintf('%s',newfile), 'linkpicsBlockDiff')
            end       
        end
        bdclose all 
       
 links(cellfun('isempty',links)) = [];
 temp='_';
 xlswrite('Block_Parameter_Difference.xlsx',temp,'Sheet1');
 filename=[pwd '\Block_Parameter_Difference.xlsx'];
 exl = actxserver('excel.application');
 exlWkbk = exl.Workbooks;
 exlFile = exlWkbk.Open(filename);
 exlFile.Worksheets.Item(1).Name = 'Block_Parameters_Difference';
 images =[pwd '\linkpicsBlockDiff\'];
 jpegfiles=dir(fullfile(images,'*.jpeg*'));
 n=numel(jpegfiles); 
%  if strcmp(colour,'red')
     
 for i=1:length(links)
      exlFile.Sheets.Add([], exlFile.Sheets.Item(exlFile.Sheets.Count))
 end
 for i=1:exlFile.Sheets.Count
 str=exlFile.Worksheets.Item(i).Name;
 if strfind(str,'Sheet')
     str=strrep(str,'Sheet','Ref');
 exlFile.Worksheets.Item(i).Name = str;
 end
 end
%  count=1;
 for i=1:length(links)
 str=regexprep(links{i}, '/', '_');
 y=num2str(i);
   range=strcat('A',y);
 exlFile.Sheets.Item(1).Range(sprintf('%s',range)).Value=links{i};
 for j=1:n
 picname=regexprep(jpegfiles(j).name,'.jpeg','');
 if strcmp(str,picname) 
 exlSheet1 = exlFile.Sheets.Item(1);
       a=num2str(i);
     range=strcat('B',a);  
 rngObj = exlFile.Sheets.Item(1).Range(sprintf('%s',range)); %we will add the link to this cell
 Anchor=rngObj;
 Address='';
  a=num2str(i);
 subadd=strcat('Ref',a,'!A1');
 SubAddress=subadd;
 DisplayText=links{i};
 Description=links{i};
 exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);
   a=num2str(1);
     range=strcat('A',a);  
 rngObj = exlFile.Sheets.Item(i+1).Range(sprintf('%s',range)); %we will add the link to this cell
 Anchor=rngObj;
 Address='';

subadd=strcat('Block_Parameters_Difference','!A1');
SubAddress=subadd;
DisplayText='Back';
Description='Back';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);
% count=count+1;
end    
end
end
% count=1;
  for i=1:length(links)
  str=regexprep(links{i}, '/', '_');
  for j=1:n
  picname=regexprep(jpegfiles(j).name,'.jpeg','');
  if strcmp(str,picname)&& strfind(str,model_name_1)
  range='B4'; 
 sheet = get(exlFile.Sheets, 'Item',i+1);
 sheet.Activate;
  left = sheet.Range(range).Left;
 top = sheet.Range(range).Top;
 st=[images jpegfiles(j).name];
 sheet.Shapes.AddPicture(st,0,1,left,top,-1,-1);
%  count=count+1;
  end
  end
  end
%   count=1;
 for i=1:length(links)
  str=regexprep(links{i}, '/', '_');
  str=strrep(str,model_name_1,model_name_2);
  for j=1:n
  picname=regexprep(jpegfiles(j).name,'.jpeg','');
  if strcmp(str,picname)&& strfind(str,model_name_2)
  range='AK4'; 
 sheet = get(exlFile.Sheets, 'Item',i+1);
 sheet.Activate;
  left = sheet.Range(range).Left;
 top = sheet.Range(range).Top;
 st=[images jpegfiles(j).name];
 sheet.Shapes.AddPicture(st,0,1,left,top,-1,-1);
%  count=count+1;
  end
  end
 end
 
  exlFile.Save();
 exlFile.Close();
 exl.Quit;
 exl.delete;   
          

          
           
            end
        function Model_two_highlighting(A_Missing,model_name_1)
            clc
             a=size(A_Missing);
            load_system(model_name_1);
   
        for i=1:2:a(2)
            m=1;
        for j=2:a(1)
      
        str1=regexprep(char(A_Missing{j,i}),' ', '');
        str1=regexprep(str1, '\w*[/]*$', '');
         str1=regexprep(str1, '/$', '');
        arr{m}=str1;
        m=m+1;
        if ~isempty(A_Missing{j,i})
              set_param(sprintf('%s',A_Missing{j,i}),'BackgroundColor','magenta');
        end
         
        end
        end
        end
        
        function BlockParameterScreenshot(A_Missing,A_Missing_c,A_Diff,A_Diff_c,model_name_1,model_name_2)   
            
              
 a=size(A_Missing);
  mkdir linkpics
  delete('linkpics\*')
   load_system(model_name_1);
   load_system(model_name_2);
 links={};
 link=1;
        for i=1:2:a(2)
            m=1;
        for j=2:a(1)
      
        str1=regexprep(char(A_Missing{j,i}),' ', '');
        str1=regexprep(str1, '\w*[/]*$', '');
         str1=regexprep(str1, '/$', '');
        arr{m}=str1;
        m=m+1;
%         if ~isempty(A_Missing{j,i})
%               set_param(sprintf('%s',A_Missing{j,i}),'BackgroundColor','red');
%         end
        end
        C = unique(arr);
        for k=1:length(C)
            
links{link}=C{k};
         link=link+1;
        end
        end
        links(cellfun('isempty',links)) = [];
        if ismember(model_name_1,links)==0    
            links1={model_name_1};
            m=2;
            for i=1:length(links)
               links1{m}=links{i};
               m=m+1;
            end   
            links=links1;
        end    
        configDialogBox.block_paramter_difference_highlighting(A_Missing,A_Missing_c,A_Diff,A_Diff_c,links,model_name_1,model_name_2)
        configDialogBox.Model_two_highlighting(A_Missing_c,model_name_2)
         load_system(model_name_1);
         for i=1:2:a(2)
        for j=2:a(1)
        if ~isempty(A_Missing{j,i})
              set_param(sprintf('%s',A_Missing{j,i}),'BackgroundColor','red');
        end
        end
         end
       load_system(model_name_2);
       load_system(model_name_1); 
        for i=1:length(links)
            strf=strrep(links{i},model_name_1,model_name_2);
            
                if i==1
              open_system(model_name_2)
              open_system(model_name_2)
         print -djpeg -s bb_model.jpeg
         newfile1=sprintf('%s.jpeg',model_name_2);
oldfile1='bb_model.jpeg';
movefile(oldfile1,newfile1)
movefile(sprintf('%s',newfile1), 'linkpics')
            open_system(model_name_1)
            open_system(model_name_1)
            print -djpeg -s aa_model.jpeg
            newfile=sprintf('%s.jpeg',model_name_1);
oldfile='aa_model.jpeg';
movefile(oldfile,newfile)
movefile(sprintf('%s',newfile), 'linkpics')
                end
               
           sys=model_name_2;
SubSystemBlocks = find_system(sys,'LookUnderMasks','all','BlockType','SubSystem');
            if ismember(strf,SubSystemBlocks) 
           open_system(strf)
         print -djpeg -s bb_model.jpeg
            open_system(links{i})
            print -djpeg -s aa_model.jpeg
            
 str1=regexprep(strf, '/', '_');
newfile1=sprintf('%s.jpeg',str1);
oldfile1='bb_model.jpeg';
movefile(oldfile1,newfile1)
movefile(sprintf('%s',newfile1), 'linkpics')
  
str=regexprep(links{i}, '/', '_');
newfile=sprintf('%s.jpeg',str);
oldfile='aa_model.jpeg';
movefile(oldfile,newfile)
movefile(sprintf('%s',newfile), 'linkpics')
            end       
        end
        bdclose all 
       
 links(cellfun('isempty',links)) = [];
 
 filename=[pwd '\Block_Parameter_Comparison.xlsx'];
 exl = actxserver('excel.application');
 exlWkbk = exl.Workbooks;
 exlFile = exlWkbk.Open(filename);
 exlFile.Worksheets.Item(1).Name = 'Links';





 images =[pwd '\linkpics\'];
 jpegfiles=dir(fullfile(images,'*.jpeg*'));
 n=numel(jpegfiles); 
%  if strcmp(colour,'red')
     
 for i=1:length(links)
      exlFile.Sheets.Add([], exlFile.Sheets.Item(exlFile.Sheets.Count))
 end
 for i=1:exlFile.Sheets.Count
 str=exlFile.Worksheets.Item(i).Name;
 if strfind(str,'Sheet')
     str=strrep(str,'Sheet','Ref');
 exlFile.Worksheets.Item(i).Name = str;
 end
 end
%  count=1;
 for i=1:length(links)
 str=regexprep(links{i}, '/', '_');
 y=num2str(i);
   range=strcat('A',y);
 exlFile.Sheets.Item(1).Range(sprintf('%s',range)).Value=links{i};
 for j=1:n
 picname=regexprep(jpegfiles(j).name,'.jpeg','');
 if strcmp(str,picname) 
 exlSheet1 = exlFile.Sheets.Item(1);
       a=num2str(i);
     range=strcat('B',a);  
 rngObj = exlFile.Sheets.Item(1).Range(sprintf('%s',range)); %we will add the link to this cell
 Anchor=rngObj;
 Address='';
  a=num2str(i);
 subadd=strcat('Ref',a,'!A1');
 SubAddress=subadd;
 DisplayText=links{i};
 Description=links{i};
 exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);
 
   a=num2str(1);
     range=strcat('A',a);  
 rngObj = exlFile.Sheets.Item(i+4).Range(sprintf('%s',range)); %we will add the link to this cell
 Anchor=rngObj;
 Address='';

subadd=strcat('Links','!A1');
SubAddress=subadd;
DisplayText='Back';
Description='Back';
exlSheet1.HyperLinks.Add(Anchor,Address,SubAddress,Description,DisplayText);
% count=count+1;
end    
end
end
% count=1;
  for i=1:length(links)
  str=regexprep(links{i}, '/', '_');
  for j=1:n
  picname=regexprep(jpegfiles(j).name,'.jpeg','');
  if strcmp(str,picname)&& strfind(str,model_name_1)
  range='B4'; 
 sheet = get(exlFile.Sheets, 'Item',i+4);
 sheet.Activate;
  left = sheet.Range(range).Left;
 top = sheet.Range(range).Top;
 st=[images jpegfiles(j).name];
 sheet.Shapes.AddPicture(st,0,1,left,top,-1,-1);
%  count=count+1;
  end
  end
  end
%   count=1;
 for i=1:length(links)
  str=regexprep(links{i}, '/', '_');
  str=strrep(str,model_name_1,model_name_2);
  for j=1:n
  picname=regexprep(jpegfiles(j).name,'.jpeg','');
  if strcmp(str,picname)&& strfind(str,model_name_2)
  range='AK4'; 
 sheet = get(exlFile.Sheets, 'Item',i+4);
 sheet.Activate;
  left = sheet.Range(range).Left;
 top = sheet.Range(range).Top;
 st=[images jpegfiles(j).name];
 sheet.Shapes.AddPicture(st,0,1,left,top,-1,-1);
%  count=count+1;
  end
  end
 end
  exlFile.Save();
 exlFile.Close();
 exl.Quit;
 exl.delete;

        end
    end
 end
       



 
 


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
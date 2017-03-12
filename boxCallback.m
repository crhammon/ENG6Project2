function boxCallback(clicked,~)
  clicked.Visible='on';
  clicked.FaceColor = evalin('base','color');
  position = clicked.Position;
  count = evalin('base','count');
  number = evalin('base','select');
  
  if evalin('base','count')==10
      errordlg('You have reached your limit for this selection! Please choose a different option for placement.')

      error

  end
  switch number
      case 0
          clicked.Visible = 'off';
          
      case 1
          % set an array proportional to the rectangular array to put
          % selection number in and that will store the data type of
          % selection
          assignin('base','count1',evalin('base','count1')+1);
          assignin('base','count',evalin('base','count')+1);
      case 2
          assignin('base','count2',evalin('base','count2')+1);
          assignin('base','count',evalin('base','count')+1);
      case 3
          assignin('base','count3',evalin('base','count3')+1);
          assignin('base','count',evalin('base','count')+1);
      case 4
          assignin('base','count4',evalin('base','count4')+1);
          assignin('base','count',evalin('base','count')+1);
      case 5
          assignin('base','count5',evalin('base','count5')+1);
          assignin('base','count',evalin('base','count')+1);
      case 6
          assignin('base','count6',evalin('base','count6')+1);
          assignin('base','count',evalin('base','count')+1);
      case 7
          assignin('base','count7',evalin('base','count7')+1);
          assignin('base','count',evalin('base','count')+1);
      case 8
          assignin('base','count8',evalin('base','count8')+1);
          assignin('base','count',evalin('base','count')+1);
      case 9
          assignin('base','count9',evalin('base','count9')+1);
          assignin('base','count',evalin('base','count')+1);
      case 10
          assignin('base','count10',evalin('base','count10')+1);
          assignin('base','count',evalin('base','count')+1);
      case 11
          assignin('base','count11',evalin('base','count11')+1);
          assignin('base','count',evalin('base','count')+1);
      case 12
          assignin('base','count12',evalin('base','count12')+1);
          assignin('base','count',evalin('base','count')+1);
      case 13
          assignin('base','count13',evalin('base','count13')+1);
          assignin('base','count',evalin('base','count')+1);
      case 14
          assignin('base','count14',evalin('base','count14')+1);
          assignin('base','count',evalin('base','count')+1);
      case 15
          assignin('base','count15',evalin('base','count15')+1);
          assignin('base','count',evalin('base','count')+1);
      case 16
          assignin('base','count16',evalin('base','count16')+1);
          assignin('base','count',evalin('base','count')+1);
      case 17
          assignin('base','count17',evalin('base','count17')+1);
          assignin('base','count',evalin('base','count')+1);
      case 18
          assignin('base','count18',evalin('base','count18')+1);
          assignin('base','count',evalin('base','count')+1);
          
  end
  
  name = evalin('base','name')
  
  switch name
      
      case 'Plot1.jpg'
          array = evalin('base','Plot1Info');
                  
      case 'Plot2.jpg'
          array = evalin('base','Plot2Info');
            
      case 'Plot3.jpg'
          array = evalin('base','Plot3Info');
            
  end
  
  selectionNum=evalin('base','select');

  position=clicked.Position(1:2);

%   countArrayPlot1=evalin('base','countArrayPlot1');

  xpos=(ceil((position(2)/15)));

  ypos=(ceil((position(1)/15)));

  array(xpos,ypos)=selectionNum;
  
  switch name
      
    case 'Plot1.jpg'
        assignin('base','Plot1Info',array)
                  
    case 'Plot2.jpg'
        assignin('base','Plot2Info',array)
            
    case 'Plot3.jpg'
        assignin('base','Plot3Info',array)
            
  end
  
end
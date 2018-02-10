function  [height]=animate_fluid_tank(pressure)
% pressure is a vector containing the pressure of each tank in N/m/m
% Height a vector containing the height ot each tank in meters. It is global.
% The length of Height and pressure must match.

persistent  Tank Fluid P2H
global Height

if length(Height) ~= length(pressure),
    error('Invalid dimensions in animate_fluid_tank.')
end
if isempty(Tank),            %Init Tank data  
      density   =   1000;               % kg/m/m/m
      gravity   =   9.8;                % m/s/s
      P2H   =1/(density*gravity);       % conversion from pressure to height
      hold off
        
      height=P2H*pressure               % fluid height, m     
      
     %Plot the first frame of the animation%      
     % The animation 
     cla                               % clear current axis
     for i=1:length(Height);           % Draw each tank at correct Height
         Tank(i) = plot([i i], [0 Height(i)], 'k', 'EraseMode', ...
             'normal','LineWidth',[50]);
         if i==1,
             hold on       % hold the above so that it need not redraw
         end
     end
     axis([0 (length(Height)+1) 0 (max(Height)+1)])    %
      
      for i=1:length(Height);           % Draw Fluid heights
          Fluid(i) = plot([i i], [0 height(i)], 'b', 'EraseMode', ...
              'normal','LineWidth',[50]);
      end
      title('Fluid Tank Animation')
      xlabel('Integer Tank Number')
      ylabel('Fluid Hieght (m)')
else
%Run the animation%            
      height=P2H*pressure;              % fluid height, m     
      for i=1:length(Height);           % Draw Fluid heights
          if height(i)<0
              error('A tank is dry')
          elseif height(i)>Height(i),
              error('A tank is overflowing')
          end
          set(Fluid(i),'YData', [0 height(i)]);
      end
      drawnow;
end





% if isempty(Area),            %Init Tank data  
%       density   =   1000;               % kg/m/m/m
%       gravity   =   9.8;                % m/s/s
%       hold off
%         
%       P2H   =1/(density*gravity);       % conversion from pressure to height
%     
%       height=P2H*pressure              % fluid height, m     
%       
%      %Plot the first frame of the animation%      
%      % The animation 
%       cla                               %JF clear current axis
%       Tank = plot([Length/2 Length/2], [0 Height], 'k', 'EraseMode', ...
%       'xor','LineWidth',[100]);
%       hold on
%       Fluid = plot([Length/2 Length/2], [0 height], 'b', 'EraseMode', ...
%       'xor','LineWidth',[100]);
%       
%       axis([0 Length 0 Height])             % Full tank is full scale
%       title('Fluid Tank Animation')
%       ylabel('Fluid Hieght (m)')
% else
% %Run the animation%            
%       height=P2H*pressure              % fluid height, m     
%       set(Fluid,'YData', [0 height]); 
%       drawnow;
% end

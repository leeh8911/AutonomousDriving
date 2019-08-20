classdef Pendulum
    properties(Access = private)
        L;
        
        start_position_x;
        start_position_y;
        end_position_x;
        end_position_y;
        
        theta;
    end
    properties(Access = public)
        fig;
        ax;
    end
    
    properties(Constant)
        g = 9.81;
    end
    methods(Access = public)
        function obj = create_(varargin)
            obj = varargin{1};
            if length(varargin) < 2
                L_ = 1;
            else
                L_ = varargin{2};
            end
            
            idx = find(strcmp(varargin, "start_position_x"));
            if~isempty(idx)
                start_position_x_ = varargin{idx+1};
            end
            
            idx = find(strcmp(varargin, "start_position_y"));
            if~isempty(idx)
                start_position_y_ = varargin{idx+1};
            end
            
            idx = find(strcmp(varargin, "end_position_x"));
            if~isempty(idx)
                end_position_x_ = varargin{idx+1};
            end
            
            idx = find(strcmp(varargin, "end_position_y"));
            if~isempty(idx)
                end_position_y_ = varargin{idx+1};
            end
            
            idx = find(strcmp(varargin, "theta"));
            if~isempty(idx)
                theta_ = varargin{idx+1};
            end
            
            obj.L = L_;
            if ~exist("start_position_x_") || ~exist("start_position_y_")
                start_position_x_ = 0;
                start_position_y_ = 0;
            else
%                 start_position_x_;
%                 start_position_y_;
            end
            
            if (~exist("end_position_x_") || ~exist("end_position_y_")) && ~exist("theta_")
                theta_ = 0;
                end_position_x_ = start_position_x_ + L_ * cosd(theta_);
                end_position_y_ = start_position_y_ + L_ * sind(theta_);
            elseif (~exist("end_position_x_") || ~exist("end_position_y_")) && exist("theta_")
                end_position_x_ = start_position_x_ + L_ * cosd(theta_);
                end_position_y_ = start_position_y_ + L_ * sind(theta_);
            elseif (exist("end_position_x_") && exist("end_position_y_")) && ~exist("theta_")
                del_x = end_position_x_ - start_position_x_;
                del_y = end_position_y_ - start_position_y_;
                theta_ = atan2d(del_y, del_x);
            else
                theta_ = 0;
                end_position_x_ = start_position_x_ + L_ * cosd(theta_);
                end_position_y_ = start_position_y_ + L_ * sind(theta_);
                disp(" WRN - 01 - PENDULUM : not defined condition")
            end
            
            obj.L = L_;
            obj.theta = theta_;
            obj.start_position_x = start_position_x_;
            obj.start_position_y = start_position_y_;
            obj.end_position_x = end_position_x_;
            obj.end_position_y = end_position_y_;
                
            
            
        end
        function obj = statusDisplay(obj)
            disp("Current states in pendulum");
            disp(strcat("Angle [deg] : ", num2str(obj.theta)));
            disp(strcat("Length[m] : ", num2str(obj.L)));
            disp(strcat("start position <x, y>[m] : <", num2str(obj.start_position_x), ", ", num2str(obj.start_position_y), ">"));
            disp(strcat("end   position <x, y>[m] : <", num2str(obj.end_position_x), ", ", num2str(obj.end_position_y), ">"));
        end
        
        function obj = getFigure(obj, fig_, ax_)
            if nargin == 1
                obj.fig = figure();
                obj.ax = axes();
            elseif nargin == 2
                obj.fig = fig_;
                obj.ax = axes();
            else
            obj.fig = fig_;
            obj.ax = ax_;
            end
        end
        
        function obj = drawFigure(obj)
            if isempty(obj.ax)
                obj.fig = figure;
                obj.ax = axes;
            end
            plot(obj.ax, [obj.start_position_x, obj.end_position_x], ...
                         [obj.start_position_y, obj.end_position_y], ...
                         'linestyle', '-', 'color', 'b');
                     
            plot(obj.ax, [obj.start_position_x], ...
                         [obj.start_position_y], ...
                         'marker', 'o', 'color', 'b');
                     
            plot(obj.ax, [obj.end_position_x], ...
                         [ obj.end_position_y], ...
                         'marker', 'p', 'color', 'b');
            
            
        end
        
        function obj = delete(obj)
            obj = [];
        end
    end
end
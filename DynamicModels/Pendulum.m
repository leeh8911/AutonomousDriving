classdef Pendulum
    properties(Access = private)
        theta;
        L;
    end
    properties(Constant)
        g = 9.81;
    end
    methods(Access = public)
        function obj = create_(obj, ini_theta, ini_L)
            if nargin <= 1
                ini_theta = 90;
                ini_L = 1;
            elseif nargin <= 2
                ini_L = 1; %[m]
            end
            
            obj.theta = ini_theta;
            obj.L = ini_L;
        end
        function obj = statusDisplay(obj)
            out.theta = obj.theta;
            out.L = obj.L;
            disp("Current states in pendulum");
            disp(strcat("Angle [deg] : ", num2str(out.theta)));
            disp(strcat("Length[m] : ", num2str(out.L)));
        end
    end
end
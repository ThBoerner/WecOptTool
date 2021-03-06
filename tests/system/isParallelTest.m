function tests = isParallelTest()
   tests = functiontests(localfunctions);
end

function testIsParallelTrue(testCase)

    import WecOptTool.system.hasToolbox
    
    installed = hasToolbox("Distrib_Computing_Toolbox",   ...
                           "Parallel Computing Toolbox");
    testCase.assumeTrue(installed, 'Parallel toolbox not available')
    
    tests = zeros(1, 2);
    
    parfor i = 1:length(tests)
        tests(i) = WecOptTool.system.isParallel();
    end
    
    verifyEqual(testCase, all(tests), true)

end

function testIsParallelFalse(testCase)

    tests = zeros(1, 2);
    
    for i = 1:length(tests)
        tests(i) = WecOptTool.system.isParallel();
    end
    
    verifyEqual(testCase, any(tests), false)

end

% Copyright 2020 National Technology & Engineering Solutions of Sandia, 
% LLC (NTESS). Under the terms of Contract DE-NA0003525 with NTESS, the 
% U.S. Government retains certain rights in this software.
%
% This file is part of WecOptTool.
% 
%     WecOptTool is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     WecOptTool is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with WecOptTool.  If not, see <https://www.gnu.org/licenses/>.

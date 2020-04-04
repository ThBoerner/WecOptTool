
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
 
function tests = cleanNemohTest()
   tests = functiontests(localfunctions);
end

function testRemovesDir(testCase)

    import matlab.unittest.fixtures.TemporaryFolderFixture
    
    tempFixture = testCase.applyFixture(                            ...
             TemporaryFolderFixture('PreservingOnFailure',  true,   ...
                                    'WithSuffix', 'cleanNemohTest'));
    
    % calling getNemoh to generate files
    w = linspace(0.1,1,10);
    r=[0 1 1 0]; 
    z=[.5 .5 -.5 -.5];
    rundir = fullfile(tempFixture.Folder, 'test');
    WecOptLib.nemoh.getNemoh(r,z,w,rundir);
    
    % running cleanNemoh to immediately remove created files
    WecOptLib.nemoh.cleanNemoh(rundir)
    
    % checking that all created files and directories are gone
    actVal = ~exist(rundir, 'dir');
    
    % evaluating testCase 
    verifyTrue(testCase, actVal);
    
end
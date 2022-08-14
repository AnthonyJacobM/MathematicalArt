function pc_map
%% Fuction to generate an abstraction
figure(); % Open a figure
%set_figure_defaults; % Establish Figure Defaults
grid off; % Remove grid
axis off; % Turn Axis Off
a = -1; % lower bound of random variable
b = 1; % upper bound of random variable
r = a + (b-a) * rand(2); % Generate 2-random variables
Z=r(1)+r(2)*i; % Generate a random complex #
col=randi(15); % Generate random integer less than or equal to K
m=2500; % Number of iterations --> e.g. Resolution.
sc = rand(1); % Scales the magnitude of grid.
cx = r(1)*sc; % Normalized random variable for grid
cy = cx; % y-values of the grid.
la = 3;
lb = 8;
lspan = floor(la + (lb - la)*rand(1)); % Random distance from center
x=linspace(cx-lspan,cx+lspan,m); % grid values in x
y=linspace(cy-lspan,cy+lspan,m); % grid values in y
[X,Y]=meshgrid(x,y); % Generate meshgrid in xy coordinate plane
C=X+i*Y; % Grid of Complex Values.
for k=1:col
    Z=conj(Z).^(Z)+C;
    %W=exp(-abs(Z))./(exp(-abs(Z))+1);
    %W=log(-abs(Z))./(log(-abs(Z))+1);
    %W = tanh(-(abs(Z)));
    %W=exp(cos(abs(Z))./(abs(Z)));
    %W=log(-1./(csc(abs(Z)).*1./(1+sec(abs(Z)))));
    %W = tan(abs(Z))./(1+tan(abs(Z)));
    %W = exp(sin(abs(Z)).*cos(abs(Z)));
    W = exp(-(abs(1./cos(Z))));
end
%W=sqrt(conj(W).*W);
pcolor((real(abs(W))));
shading interp
axis off;






%%%%%%%%%%%%%%%%%%%%%%%%%
N = 70;
cx = linspace(0.05, 0.75, N)';
cy = linspace(0.05, 0.75, N)';
cz = [linspace(0.05, 0.4, N/2), linspace(0.5, 1, N/2)]';
cmap = [cx, cy, cz];
cmap_g = [cx, cz, cy];
cmap_r = [cz, cx, cy];

N=70;
vals = hot(N);
vals_permut = [vals(:,3), vals(:,2), vals(:,1)];
vals_permut_g = [vals(:,3), vals(:,1), vals(:,2)];

colormap(vals_permut);

flp_bool = 0; % boolean to flip cmap.
c=hot(50);d=flip(c); % Generate a cmap.
% Iterate conditional based on boolean to flip.
if flp_bool==0
    colormap([d;c;d]);
    colormap(vals_permut);
else
    colormap([c;d;c]);
    colormap(flip(vals_permut));
end


set(gcf, 'color', 'w');
set(gca, 'color', 'w');




end
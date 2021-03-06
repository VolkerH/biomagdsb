%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GENERATE_IMAGE Function for generating ideal images from created objects
% Input:  (1) struct with all simulated objects
%         (2) population level paramters
% Output: (1) struct with all ideal images
%
% (C) 22.2.2007 Antti Lehmussola
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[image,bw,cells] = generate_image_dsb(objects,population)

%Initialize the images
if ~isempty(objects.nuclei)
    image.nuclei = zeros(size(population.template));
    bw.nuclei = zeros(size(population.template));
else
    image.nuclei = [];
    bw.nuclei = [];
end

if ~isempty(objects.cytoplasm)
    image.cytoplasm = zeros(size(population.template));
    bw.cytoplasm = zeros(size(population.template));
else
    image.cytoplasm = [];
    bw.cytoplasm = [];
end

if ~isempty(objects.subcell)
    image.subcell = zeros(size(population.template));
    bw.subcell = zeros(size(population.template));
else
    image.subcell = [];
    bw.subcell = [];
end

cells = cell(length(objects.nuclei),1);

%Insert the objects in the images
for ind = 1:length(objects.nuclei)
    
    if ~isempty(image.nuclei)
        [image.nuclei,bw.nuclei] = object2image_dsb(objects.nuclei(ind),image.nuclei,bw.nuclei);
    end
    
    if ~isempty(image.cytoplasm)
        [image.cytoplasm,bw.cytoplasm] = object2image(objects.cytoplasm(ind),image.cytoplasm,bw.cytoplasm);
    end
    
    if ~isempty(image.subcell)
        [image.subcell,bw.subcell] = object2image(objects.subcell(ind),image.subcell,bw.subcell);
    end
    
    c = struct('shape',getshape(objects.nuclei(ind)),'coords',getcoords(objects.nuclei(ind)));
    
    cells{ind} = c;
    
end

% Compensate overlapping objects
if ~isempty(objects.nuclei)
    tmp = bw.nuclei;
    tmp(tmp == 0) = Inf;
    image.nuclei = image.nuclei./tmp;
end

if ~isempty(objects.cytoplasm)
    tmp = bw.cytoplasm;
    tmp(tmp == 0) = Inf;
    image.cytoplasm = image.cytoplasm./tmp;
end

if ~isempty(objects.subcell)
    tmp = bw.subcell;
    tmp(tmp == 0) = Inf;
    image.subcell = image.subcell./tmp;
end

function demo_brute_force_root_finder()
    roots = brute_force_root_finder(
        @(x) exp(-x.^2).*cos(4*x), 0, 4, 1001);
    if length(roots) > 0
        roots
    else
        fprintf('Could not find any roots');
    end
end
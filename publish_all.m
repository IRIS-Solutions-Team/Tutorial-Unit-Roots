
mkdir('mat');
delete('mat/*');

mkdir('html-source');
delete('html-source/*');

publish.model('exog_growth_stationarized.model');
publish.model('exog_growth_unit_root.model');
publish.mfile('read_models.m');
publish.mfile('compare_shock_simulations.m');
publish.mfile('compare_acf.m');


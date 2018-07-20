function [gait, sol, info] = load_result(nlp, file)


output = loadjson(file);
sol = output.x';


gait = two_step.utils.parse(nlp, sol);


info = struct();
info.status = output.status;
info.zl = output.zl;
info.zu = output.zu;
info.lambda = output.zu;

end
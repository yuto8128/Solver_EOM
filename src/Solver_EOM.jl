module Solver_EOM

function timeprop(F::Function, tmax, x0, a0, h)

    t_pre = 0.0
    x_pre = x0
    a_pre = a0
    while (t_pre < tmax)
        t_new = t_pre + h
        x_new = x_pre + a_pre           * h
        a_new = a_pre + F(t_pre, x_pre) * h
        
        t_pre = t_new
        x_pre = x_new
        a_pre = a_new
    end
    return (x_pre, a_pre)
end
end # module Solver_EOM
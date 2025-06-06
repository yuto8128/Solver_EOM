module Solver_EOM

greet() = print("Hello World!")

function timeprop(F::Function, tmax, x0, a0, h)
    currentF::Float64 = F(x, t)

    x_pre = x0
    a_pre = a0
    t_pre = 0
    while (t_pre < tmax)
        t_new = t_pre + h
        a_new = a_pre + F(t_pre, x_pre) * h
        x_new = x_pre + a_pre * h

end # module Solver_EOM

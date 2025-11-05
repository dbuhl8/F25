function state_dot = ode_2D(t,state)
    x = state(1);
    y = state(2);
    dxdt = exp(y);
    dydt = x;
    state_dot = [dxdt;dydt];
end

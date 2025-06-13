using Test
import Solver_EOM: timeprop

@testset "Solver_EOM.jl" begin
    @testset "Uniform velocity motion" begin
        F(x, t) = 0.0
        tmax = 1.0
        x0 = 0.0
        a0 = 1.0
        h = 1e-3

        x_final, a_final = timeprop(F, tmax, x0, a0, h)

        expected_x = x0 + a0 * tmax
        expected_a = a0
        @test isapprox(x_final, expected_x, rtol=1e-10)
        @test isapprox(a_final, expected_a, rtol=1e-10)
    end

    @testset "Uniform acceleration motion" begin
        F(t, x) = 1.0
        tmax = 1.0
        x0 = 0.0
        a0 = 0.0
        h = 1e-4

        x_final, a_final = timeprop(F, tmax, x0, a0, h)

        expected_x = x0 + a0*tmax + tmax^2/2.0
        expected_a = a0 + tmax
        @test isapprox(x_final, expected_x, rtol=1e-3)
        @test isapprox(a_final, expected_a, rtol=1e-3)
    end

    @testset "Uniform jerk motion" begin
        F(t, x) = t
        tmax = 1.0
        x0 = 0.0
        a0 = 0.0
        h = 1e-4
        
        x_final, a_final = timeprop(F, tmax, x0, a0, h)
        
        expected_x = x0 + a0*tmax + tmax^3/6.0
        expected_a = a0 + tmax^2/2.0
        @test isapprox(x_final, expected_x, rtol=1e-3)
        @test isapprox(a_final, expected_a, rtol=1e-3)
    end

    @testset "Harmonic Vibration" begin
        F(t, x) = -x
        tmax = 1.0
        x0 = 0.0
        a0 = 1.0
        h = 1e-6
        
        x_final, a_final = timeprop(F, tmax, x0, a0, h)
        
        expected_x = sin(tmax)
        expected_a = cos(tmax)
        @test isapprox(x_final, expected_x, rtol=1e-5)
        @test isapprox(a_final, expected_a, rtol=1e-5)
    end

end


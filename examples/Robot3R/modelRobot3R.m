
s2 = sin(th2);s3 = sin(th3);
s23 = sin(th2+th3);
c1 = cos(th1);c2 = cos(th2);c3 = cos(th3);
c12 = cos(th1+th2);c23 = cos(th2+th3);
c123 = cos(th1+th2+th3);
M = zeros(3,3);
M(1,1) = I_1+I_2+I_3+L1^2*m_2+L1^2*m_3+L2^2*m_3+Lc1^2*m_1+Lc2^2*m_2+Lc3^2*m_3+L1*Lc3*m_3*c23*2.0+L1*L2*m_3*c2*2.0+L1*Lc2*m_2*c2*2.0+L2*Lc3*m_3*c3*2.0;
M(1,2) = I_2+I_3+L2^2*m_3+Lc2^2*m_2+Lc3^2*m_3+L1*Lc3*m_3*c23+L1*L2*m_3*c2+L1*Lc2*m_2*c2+L2*Lc3*m_3*c3*2.0;
M(1,3) = I_3+Lc3^2*m_3+L1*Lc3*m_3*c23+L2*Lc3*m_3*c3;
M(2,1) = I_2+I_3+L2^2*m_3+Lc2^2*m_2+Lc3^2*m_3+L1*Lc3*m_3*c23+L1*L2*m_3*c2+L1*Lc2*m_2*c2+L2*Lc3*m_3*c3*2.0;
M(2,2) = I_2+I_3+L2^2*m_3+Lc2^2*m_2+Lc3^2*m_3+L2*Lc3*m_3*c3*2.0;
M(2,3) = I_3+Lc3^2*m_3+L2*Lc3*m_3*c3;
M(3,1) = I_3+Lc3^2*m_3+L1*Lc3*m_3*c23+L2*Lc3*m_3*c3;
M(3,2) = I_3+Lc3^2*m_3+L2*Lc3*m_3*c3;
M(3,3) = I_3+Lc3^2*m_3;
C = zeros(3,1);
C(1,1) = -L1*w_2^2*(L2*m_3*s2+Lc2*m_2*s2+Lc3*m_3*s23)-Lc3*m_3*w_3^2*(L1*s23+L2*s3)-L1*w_1*w_2*(L2*m_3*s2+Lc2*m_2*s2+Lc3*m_3*s23)*2.0-Lc3*m_3*w_1*w_3*(L1*s23+L2*s3)*2.0-Lc3*m_3*w_2*w_3*(L1*s23+L2*s3)*2.0;
C(2,1) = L1*L2*m_3*w_1^2*s2+L1*Lc2*m_2*w_1^2*s2-L2*Lc3*m_3*w_3^2*s3+L1*Lc3*m_3*w_1^2*s23-L2*Lc3*m_3*w_1*w_3*s3*2.0-L2*Lc3*m_3*w_2*w_3*s3*2.0;
C(3,1) = Lc3*m_3*(L1*w_1^2*s23+L2*w_1^2*s3+L2*w_2^2*s3+L2*w_1*w_2*s3*2.0);
G = zeros(3,1);
G(1,1) = g*(Lc3*m_3*c123+L2*m_3*c12+Lc2*m_2*c12+L1*m_2*c1+L1*m_3*c1+Lc1*m_1*c1);
G(2,1) = g*(Lc3*m_3*c123+L2*m_3*c12+Lc2*m_2*c12);
G(3,1) = Lc3*g*m_3*c123;

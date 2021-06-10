choco install microsoft-teams.install -y --params "'/AllUsers /NoAutoStart'"
net localgroup "Utilisateurs du Bureau à distance" "985-Student" /ADD
net localgroup "Utilisateurs du Bureau à distance" "985-Faculty" /ADD
net localgroup "Utilisateurs du Bureau à distance" "985-Employee" /ADD
net localgroup "Administrateurs" "985-Student" /ADD
net localgroup "Administrateurs" "985-Faculty" /ADD
net localgroup "Administrateurs" "985-Employee" /ADD

// QuantumKeyDistribution.qs

namespace QuantumKeyDistribution {

    open Microsoft.Quantum.Intrinsic;

    // BBM92 Protocol: Champ sends qubits to Pakaya, and they perform measurements to establish a shared key.
    operation BBM92Protocol() : (Result, Result) {
        // Champ prepares an entangled state
        use qubit1 = Qubit();
        use qubit2 = Qubit();
        H(qubit1);
        CNOT(qubit1, qubit2);


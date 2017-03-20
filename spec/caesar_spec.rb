require_relative '../lib/caesar_cipher/caesar_cipher.rb'

describe ".cipher_smooth" do
  context "given empty string or wrong number arguments" do
    it "returns ArgumentError" do
      expect { Odin.cipher_smooth }.to raise_error ArgumentError
      expect { Odin.cipher_smooth("test") }.to raise_error ArgumentError
    end
  end

  context "given improper arguments" do
    error = "Must use arguments: (String, Integer)"
    it "returns ArgumentError" do
      expect { Odin.cipher_smooth(5, 5) }.to raise_error ArgumentError, error
      expect { Odin.cipher_smooth(5, "test") }.to raise_error ArgumentError, error
    end
  end

  context "given single input" do
    it "returns shifted char shift" do
      expect(Odin.cipher_smooth("w", 5)).to eq "b"
      expect(Odin.cipher_smooth("g", 3)).to eq "j"
    end
  end

  context "given string input" do
    it "returns shifted string shift" do
      expect(Odin.cipher_smooth("cde", 3)).to eq "fgh"
      expect(Odin.cipher_smooth("gfg", 10)).to eq "qpq"
    end
  end

  context "given interger input" do
    error = "String must only contain A-Za-z"
    it "returns ArgumentError" do
      expect { Odin.cipher_smooth("5", 2) }.to raise_error ArgumentError, error
      expect { Odin.cipher_smooth("5135", 5) }.to raise_error ArgumentError, error
    end
  end

  context "given mixed case input" do
    it "returns shifted string and retains case" do
      expect(Odin.cipher_smooth("AbCdEfGh", 2)).to eq "CdEfGhIj"
      expect(Odin.cipher_smooth("AbCdEfGh", 2)).not_to eq "cdEfGhIj"
    end
  end

  context "given spaces and punctuation" do
    it "returns shifted string and retains case & punctuation" do
      expect(Odin.cipher_smooth("What a String!", 5)).to eq "Bmfy f Xywnsl!"
      expect(Odin.cipher_smooth("Xxa keh Agl", 3)).to eq "Aad nhk Djo"
    end
  end
end

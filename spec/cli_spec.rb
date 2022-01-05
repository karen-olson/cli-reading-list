RSpec.describe Cli do

    describe "#validate_number_input" do
        it "only returns valid numbers" do
            cli = Cli.new
            allow(cli).to receive(:get_input).and_return("8", "n", "%", "1")
            expect(cli.validate_number_input(10, 1..3, "message")).not_to eq 10
            expect(cli.validate_number_input(7, 1..3, "message")).to eq 1
        end

        it "returns an integer" do 
            cli = Cli.new
            allow(cli).to receive(:get_input).and_return("x", 4, 1)
            expect(cli.validate_number_input(1, 1..3, "message")).to be_a(Integer)
        end
        
        it "prompts the user until it receives valid input" do 
            cli = Cli.new
            allow(cli).to receive(:get_input).and_return("x", 4, 1)
            expect{ cli.validate_number_input(-3, 1..3, "prompt") }.to output("prompt\nprompt\nprompt\n").to_stdout
        end
    end

    describe "#validate_string_input" do 
        it "only returns valid strings" do 
            cli = Cli.new
            allow(cli).to receive(:get_input).and_return(88, "p", "!", "Y")
            expect(cli.validate_string_input("input", ["Y", "N"], "message")).not_to eq "input"
            expect(cli.validate_string_input(7, ["Y", "N"], "message")).to eq "Y"
        end

        it "returns a string" do 
            cli = Cli.new
            allow(cli).to receive(:get_input).and_return("x", 4, "n")
            expect(cli.validate_string_input(100, ["Y", "N"], "message")).to be_a(String)
        end
        
        it "prompts the user until it receives valid input" do 
            cli = Cli.new
            allow(cli).to receive(:get_input).and_return("x", 4, "y")
            expect{ cli.validate_string_input(42, ["Y", "N"], "prompt") }.to output("prompt\nprompt\nprompt\n").to_stdout
        end


    end
end
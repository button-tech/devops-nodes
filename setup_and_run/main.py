#!/usr/local/bin/python3
import click
from os import system

@click.command()
@click.option('--key', prompt='Name of ssh key', help='Name of ssh key.\nExample: --key=eth.pem')
@click.option('--user', prompt='Username', help='Username.\nExample: --user=root')
@click.option('--addr', prompt='Address(ip address or domain name of remote server)', help='Address.\nExample: --addr=example.com')
@click.option('--curr', prompt="Cryptocurrency", help='Cryptocurrency\nExample: --curr=eth')
def run(key,user,addr,curr):
    """Simple program for nodes."""
    if curr == "eth" or curr == "etc":
        script = "eth_etc.sh"
    else:
        script = f"{curr}.sh"

    system(f'''ssh -i keys/\"{key}\" {user}@{addr} \"
    sudo apt-get update && sudo apt-get upgrade;
    sudo apt-get install git;
    git clone https://github.com/button-tech/devops-nodes.git;
    cd devops-nodes;
    sudo ./{script} \"''')

if __name__ == '__main__':
    run()

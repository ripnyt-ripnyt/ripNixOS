{ pkgs, ... }:

let
  myPythonPackages = pkgs: with pkgs; [
    pandas
    requests
    jupyter
    numpy
    mysql-connector
  ];
in {
  python = python3.withPackages myPythonPackages;
}
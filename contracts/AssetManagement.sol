pragma solidity ^0.5.0;

interface Oracle {
  enum QueryStatus { INVALID, OK, NOT_AVAILABLE, DISAGREEMENT }
  function query(bytes calldata input)
    external payable returns (bytes32 output, uint256 updatedAt, QueryStatus status);
  function queryPrice() external view returns (uint256);
}

contract AssetManagement {
  uint256 public ethusd;

  function update() public payable {
    Oracle oracle = Oracle(0xa24dF0420dE1f3b8d740A52AAEB9d55d6D64478e);
    (bytes32 raw,,) = oracle.query.value(oracle.queryPrice())("SPOTPX/FB");
    ethusd = uint256(raw);
  }
}
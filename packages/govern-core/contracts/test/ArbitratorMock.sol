/*
 * SPDX-License-Identifier:    MIT
 */

pragma solidity ^0.6.8;

import "../erc20/SafeERC20.sol";

contract Arbitrator {
    using SafeERC20 for ERC20;

    ERC20 public feeToken;

    event DisputeCreated(uint256 indexed possibleRulings, bytes indexed _metadata);
    event EvidencePeriodClosed(uint256 indexed disputeId);
    event RulingExecuted(uint256 indexed disputeId);

    constructor(ERC20 _feeToken) {
        feeToken = _feeToken;
    }

    /**
    * @dev Create a dispute over the Arbitrable sender with a number of possible rulings
    * @param _possibleRulings Number of possible rulings allowed for the dispute
    * @param _metadata Optional metadata that can be used to provide additional information on the dispute to be created
    * @return Dispute identification number
    */
    function createDispute(uint256 _possibleRulings, bytes calldata _metadata) external returns (uint256) {
        emit DisputeCreated(_possibleRulings, _metadata);

        return 1000;
    }

    /**
    * @dev Close the evidence period of a dispute
    * @param _disputeId Identification number of the dispute to close its evidence submitting period
    */
    function closeEvidencePeriod(uint256 _disputeId) external {
        emit EvidencePeriodClosed(_disputeId);
    }


    /**
    * @dev Execute the Arbitrable associated to a dispute based on its final ruling
    * @param _disputeId Identification number of the dispute to be executed
    */
    function executeRuling(uint256 _disputeId) external {
        emit RulingExecuted(_disputeId);
    }

    /**
    * @dev Tell the dispute fees information to create a dispute
    * @return recipient Address where the corresponding dispute fees must be transferred to
    * @return feeToken ERC20 token used for the fees
    * @return feeAmount Total amount of fees that must be allowed to the recipient
    */
    function getDisputeFees() external view returns (address recipient, ERC20 feeToken, uint256 feeAmount) {
        return (address(this), feeToken, 1000);
    }


    /**
    * @dev Tell the subscription fees information for a subscriber to be up-to-date
    * @param _subscriber Address of the account paying the subscription fees for
    * @return recipient Address where the corresponding subscriptions fees must be transferred to
    * @return feeToken ERC20 token used for the subscription fees
    * @return feeAmount Total amount of fees that must be allowed to the recipient
    */
    function getSubscriptionFees(address _subscriber) external view returns (address recipient, ERC20 feeToken, uint256 feeAmount) {
        return (address(this), feeToken, 1000);
    }
}
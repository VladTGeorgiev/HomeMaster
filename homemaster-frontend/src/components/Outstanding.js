import React, { Component } from 'react';
import { Card, Table, Checkbox, Label } from 'semantic-ui-react'

class Outstanding extends Component{
    render() {

        const uncompletedTasks = this.props.data.tasks.filter(task => task.completed === false)

        const unpaidBillSplits = this.props.data.bill_splits.filter(bill_split => bill_split.paid === false)
        // const som = unpaidBillSplits.map(uB => uB.bill_id)

        // const billNames1 = this.props.data.bills.filter(bill => bill.id === unpaidBillSplits[0].bill_id)
        // const billNames2 = this.props.data.bills.filter(bill => unpaidBillSplits.includes(bill.id))

        return (
            <Card>
                <Card.Header as='h2'>Outstanding</Card.Header>
                <Table basic='very' celled collapsing>
                    <Table.Header>
                        <Table.Row>
                            <Table.HeaderCell></Table.HeaderCell>
                            <Table.HeaderCell>Actioned?</Table.HeaderCell>
                        </Table.Row>
                    </Table.Header>
                    <Table.Body>
                        <Table.Row>
                            <Table.Cell>
                                <Label ribbon>Bills</Label>
                                    <Table.Body>
                                        <Table.Row>
                                                {unpaidBillSplits.map(unpaid_bill_split => <>
                                            <Table.Cell>
                                                {this.props.data.bills.find(bill => bill.id === unpaid_bill_split.bill_id).name}
                                                £{unpaid_bill_split.amount}
                                            </Table.Cell>
                                            </>
                                            )}
                                        </Table.Row>
                                    </Table.Body>
                                    {/* <div>
                                        {unpaidBillSplits.map(unpaid_bill_split => <>
                                        <p>{this.props.data.bills.find(bill => bill.id === unpaid_bill_split.bill_id).name}</p>
                                        <p>£{unpaid_bill_split.amount}</p>
                                        </>
                                        )}
                                    </div> */}
                                <Label ribbon>Tasks</Label>
                                    <div>{uncompletedTasks.map(false_task => <p>{false_task.name}</p>)}</div>
                            </Table.Cell>
                            <Table.Cell>
                                <div>{unpaidBillSplits.map(unpaid_bill_split => <Checkbox slider />)}</div>
                                <div>{uncompletedTasks.map(false_task => <Checkbox slider />)}</div>
                            </Table.Cell>
                        </Table.Row>
                    </Table.Body>
                </Table>
            </Card>
        )
    }
}

export default Outstanding
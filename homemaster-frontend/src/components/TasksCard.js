import React from 'react';
import { Grid, Table, Header, Image} from 'semantic-ui-react'

const TasksCard= ({tasks}) => (
    <Grid textAlign='center' style={{ height: '50vh'}} verticalAlign='top'>
        <Grid.Column style={{ width: '80vw' }}>
            <Table basic='very' celled collapsing>
                <Table.Header>
                    <Table.Row>
                        <Table.HeaderCell></Table.HeaderCell>
                        <Table.HeaderCell>Description</Table.HeaderCell>
                        <Table.HeaderCell>Due date</Table.HeaderCell>
                    </Table.Row>
                </Table.Header>

                <Table.Body>
                    <Table.Row>
                        <Table.Cell>
                            <Header as='h4'>
                                <Header.Content>
                                    {tasks.map(task => <Image src={task.img} size='small' />)}
                                </Header.Content>
                            </Header>
                        </Table.Cell>
                        <Table.Cell>
                            {tasks.map(task => <p>{task.description}</p>)}
                        </Table.Cell>
                        <Table.Cell>
                            {tasks.map(task => <p>{task.date_due}</p>)}
                        </Table.Cell>
                    </Table.Row>
                </Table.Body>
            </Table>
        </Grid.Column>
    </Grid>
)

export default TasksCard;
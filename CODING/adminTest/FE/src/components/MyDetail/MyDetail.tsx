import axios from "@/config/axios";
import { Box, Button, Grid, Paper, Typography } from "@mui/material";
import React, { Key, useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import { toast } from "react-toastify";
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';

type RowData = {
    id: Key;
};

type ListColumn<T> = {
    id: Extract<keyof T, Key>;
    label: string;
    minWidth?: number;
    align?: "right";
    isDetail?: boolean;
    isCategory?: boolean;
    format?: ((value: Date) => string) | ((value: string) => string) | ((value: number) => string);
};

type TableProps<T> = {
    url: string;
    columns: readonly ListColumn<T>[];
    deleteBut?: boolean;
    updateBut?: boolean;
};

const MyDetail = <T extends RowData>({ url, columns, deleteBut, updateBut }: TableProps<T>) => {

    const { id } = useParams<{ id: string }>();
    const [state, setState] = useState();
    const navigate = useNavigate();
    // Add type annotation to 'state' variable

    const getOneCourse = async (id: string) => { // Add type annotation to 'id' parameter
        const res = await axios.get(`${url}/${id}`);
        // console.log(res.data);
        if (res.status === 200) {
            setState(res.data.data);
        }
    }

    useEffect(() => {
        if (id) getOneCourse(id);
    }, [id]);

    const [open, setOpen] = React.useState(false);
    const [delCourse, setDelCourse] = React.useState<Key | null>(null);

    const handleClickOpen = (id: string) => {
        setOpen(true);
        setDelCourse(id);
    };

    const handleClose = () => {
        setOpen(false);
    };

    const handleDelete = async (id: string) => {
        const res = await axios.delete(`${url}/${id}`);
        if (res.status === 200) {
            toast.success("Deleted Successfully");
            navigate(`/adminTest/${url}`);
        } else {
            toast.error("Delete: Error!");
        }
        handleClose();
    }

    return (
        <Box>
            <Paper sx={{ padding: 2 }}>
                <Grid container spacing={2}>
                    {columns.map((column) => {
                        let formattedValue = state && state[column.id];
                        if (column.format) {
                            formattedValue = column.format(formattedValue);
                        }
                        return (
                            <Grid item xs={12} sm={6} md={4} key={column.id.toString()}>
                                <Typography variant="h6"
                                    sx={{ color: (theme) => theme.palette.text.secondary }}
                                >{column.label}</Typography>
                                <Typography variant="body1"
                                    sx={{
                                        color: (theme) => theme.palette.text.primary,
                                        fontWeight: "bold"
                                    }}
                                >
                                    {formattedValue}
                                </Typography>
                            </Grid>
                        );
                    })}
                </Grid>
            </Paper >
            <Box sx={{ pt: 4 }}>
                {updateBut && (
                    <Link to={`update`}>
                        <Button
                            sx={{
                                mr: 2,
                                backgroundColor: (theme) => theme.palette.primary.main,
                                color: (theme) => theme.palette.primary.contrastText,
                                ":hover": {
                                    backgroundColor: (theme) => theme.palette.primary.dark,
                                }
                            }}
                        >
                            Edit
                        </Button>
                    </Link>
                )}
                {deleteBut && (
                    <Button
                        onClick={() => handleClickOpen(id as string)}
                        sx={{
                            backgroundColor: (theme) => theme.palette.error.main,
                            color: (theme) => theme.palette.error.contrastText,
                            ":hover": {
                                backgroundColor: (theme) => theme.palette.error.dark,
                            }
                        }}
                    >
                        Delete
                    </Button>
                )}
            </Box>
            <Dialog
                open={open}
                onClose={handleClose}
                aria-labelledby="alert-dialog-title"
                aria-describedby="alert-dialog-description"
            >
                <DialogTitle id="alert-dialog-title">
                    {"Do you want to delete Course?"}
                </DialogTitle>
                <DialogContent>
                    <DialogContentText id="alert-dialog-description">
                        Are you sure that you want to delete a Course
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleClose}>No</Button>
                    <Button onClick={() => handleDelete(delCourse as string)} autoFocus>
                        Yes
                    </Button>
                </DialogActions>
            </Dialog>
        </Box>
    );
}

export default MyDetail;
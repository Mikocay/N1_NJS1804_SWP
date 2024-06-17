import { useEffect } from "react";
import { SubmitHandler, useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { branchSchema } from "../../adminCreate/Branchs/lib/branchSchema";
import { handleSubmitForm } from "@/usecases/handleSubmitForm";
import { z } from "zod";
import { put } from "@/utils/apiCaller";
import { API_ENDPOINTS } from "@/utils/api";
import { errorToastHandler } from "@/utils/toast/actions";
import { toastSuccess } from "@/utils/toast";
import { useNavigate } from "react-router-dom";

export type BranchInputs = z.infer<typeof branchSchema>;

export default function useBranchUpdate() {
    const navigate = useNavigate();

    const {
        handleSubmit,
        reset,
        control,
        setValue,
        formState: { isSubmitSuccessful, isSubmitting },
    } = useForm<BranchInputs>({
        resolver: zodResolver(branchSchema),
        defaultValues: {
            id: 0,
            // branchAvt: [],
            name: "",
            address: "",
            phone: "",
            email: "",
        },
    });

    console.log("0");

    const onSubmit: SubmitHandler<BranchInputs> = (data) => {
        console.log("1");

        const result = handleSubmitForm(data, branchSchema);

        if (!result || !result.success || result.error) {
            return;
        }

        const { id, name, address, phone, email } = data;

        console.log(data);

        put(`${API_ENDPOINTS.BRANCH.LIST}/${id}`, {
            id,
            // branchAvt,
            name,
            address,
            phone,
            email,
        })
            .then((res) => {
                const { data } = res;
                if (!data.success) {
                    return errorToastHandler(data);
                }
                // successfully
                toastSuccess("Create successfully!");
                navigate("/adminTest/branch");
            })
            .catch((err) => {
                console.log(err.response);
                errorToastHandler(err.response);
            });
    };
    useEffect(() => {
        if (isSubmitSuccessful) {
            reset();
        }
    }, [isSubmitSuccessful, reset]);

    const setValues = (values: BranchInputs) => {
        setValue("id", values.id);
        setValue("name", values.name);
        setValue("address", values.address);
        setValue("phone", values.phone);
        setValue("email", values.email);
    };

    return [handleSubmit(onSubmit), isSubmitting, control, setValues] as const;
}

#include <linux/proc_fs.h>
#include <linux/module.h>
#include <linux/uaccess.h>

MODULE_LICENSE("LK");
MODULE_AUTHOR("Jiazi");

// /proc/test and /proc/test/buf
#define PROCDIR "test"
#define PROCFILE "buf"
static struct proc_dir_entry * proc_dir = NULL; 
static struct proc_dir_entry * proc_file = NULL;  
#define MAX_SIZE 12
unsigned char str[MAX_SIZE];
static size_t proc_write(struct file * file, 
                              const char __user * buffer, 
                              size_t count,  
                              loff_t *pos)
{
	unsigned int   size_to_copy;
	size_to_copy = count>MAX_SIZE ? MAX_SIZE:count;
	memset(str, 0x0, MAX_SIZE);
	copy_from_user(str, buffer, size_to_copy);
	printk("%s", str);
	return size_to_copy;
}

static ssize_t proc_read(struct file *filp, char __user *buf, size_t count,
                loff_t *f_pos)
{
    int retval;
    const char* cur=str+*f_pos;
    const char* end=cur+count;
    if(end-cur > MAX_SIZE) {
        retval=MAX_SIZE-*f_pos;
        *f_pos=MAX_SIZE;
    }else {
        *f_pos+=count;
        retval=count;
    }
        
    if (copy_to_user(buf, str,retval)) {
		retval = -EFAULT;
        printk("%s:%p %d\n",__func__,buf,(int)count);
	}
    printk("%s:%p count=%d, retval=%d f_pos=%ld\n", __func__, buf, (int)count, retval, (long)*f_pos);
    return retval;
}

static const struct file_operations proc_fops = {
 .open  = NULL,
 .read  = proc_read,
 .write  = proc_write,
};

//----------------------------------------------------------------------------
// Initialize proc filesystem
//----------------------------------------------------------------------------
static int __init procfs_init(void)
{

    proc_dir= proc_mkdir(PROCDIR,0);
    if (proc_dir == NULL)
    {
        printk(KERN_ERR "/proc/%s/ creation failed --jiazi\n", PROCDIR);
        return -1;
    }

    proc_file = proc_create(PROCFILE, S_IFREG|S_IRWXU|S_IRWXG|S_IRWXO,
                                    proc_dir, &proc_fops);

    if (proc_file == NULL)
    {
        printk(KERN_ERR "/proc/%s/%s creation failed\n", PROCDIR, PROCFILE);
        remove_proc_entry(PROCDIR, 0);
        proc_dir = NULL;
        return -2;
    }


    return 0;
}


//----------------------------------------------------------------------------
// De-initialize proc filesystem
//----------------------------------------------------------------------------
static void __exit procfs_delete(void)
{
    if (proc_dir != NULL)
    {
        if (proc_file != NULL)
            remove_proc_entry(PROCFILE, proc_dir);

        remove_proc_entry(PROCDIR, 0);
    }
    // proc_dir and proc_file are static variables

}

module_init(procfs_init);
module_exit(procfs_delete);
